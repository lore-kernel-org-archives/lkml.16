Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C981A1F4261;
	Wed,  2 Jul 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496361; cv=none; b=skdY7rTU+SOIm7nRLjtsq4+b8QFWd9gik+6RVhAxaQgUo1WPgB6wcdmrQqqVyO2d7ZMZPDvOWBlx4PS2xwKEgHu9+eQSP+sAMf84UEiahOt8tgd98DRlFY6SL45YduByAB1FFMB3A+jG0jgrBHGdrEPYqfQJw6/QDfNwvYvdyyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496361; c=relaxed/simple;
	bh=bAxT7zPif7gDfwukFbvsyJyuLCrL/XhzO4gRr8ODT/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksGkray5DIkVCXjePNup0apxdmERkRIneSXXh2NrvZm87JmU6F5vEgiMq+ckec2in75cu4aD6HZpZr+eVRIoZUzqjIWKFbTeNMZNVSw7Asq+2UNEkY2v1rq0GmbRQ/MBJQNfJTs/d0KW/Zom+ie3Nb6oglBy2Qqlg1dUqNp22Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gX9HIzpV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gX9HIzpV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A26FF406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495759; bh=D+KAohx9yyDKsSmhMQmJNnI4DAmY9EzLf2HuMkXOofQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gX9HIzpVXXiOD9JS6W68kJerSvxYvKEDcn4DAJSwDbQ1o9NCy2Xz85ZUGqaM23Fb9
	 GdgQd5y8kjmUaq+dwgrNHCY5QO+2KxVy1j6LIkE3/x0wBykK2jmWKZZKYr9VoYcE77
	 mVFDsjdxB1X2LWt0aMtzwSoYQmVosUeqqVSmu6Pg/iUJTukeTGbU0YBrIsgdioG3M+
	 aS7AU0wWUSeeOE/nrRvxYLwxT1lwJ6bIeopDiJt29iCOa7LZ70+ZtR+Rv/41bs9fMs
	 DnfdKHr2wqRnL0YOHii/xRx1CGxIxFtmyI/rs6AW19DYt0zZCcK0CX4o/hxNY8Yd/T
	 /HjtRYRxQ0QBQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id A26FF406FC;
	Wed,  2 Jul 2025 22:35:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/12] [PATCH 00/11] Thrash up the parser/output interface
Date: Wed,  2 Jul 2025 16:35:12 -0600
Message-ID: <20250702223524.231794-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[I'll slow down soon, honest - real work is piling up...]

The kerneldoc parsing phase gathers all of the information about the
declarations of interest, then passes it through to the output phase as a
dict that is an unstructured blob of information; this organization has its
origins in the Perl version of the program.  It results in an interface
that is difficult to reason about, dozen-parameter function calls, and
other ills.

Introduce a new class (KdocItem) to carry this information between the
parser and the output modules, and, step by step, modify the system to use
this class in a more structured way.  This could be taken further by
creating a subclass of KdocItem for each declaration type (function,
struct, ...), but that is probably more structure than we need.

As a final step, add some structure for the accumulation of the output
text.

The result is (I hope) clearer code, the removal of a bunch of boilerplate,
and no changes to the generated output.

Jonathan Corbet (12):
  docs: kdoc; Add a rudimentary class to represent output items
  docs: kdoc: simplify the output-item passing
  docs: kdoc: drop "sectionlist"
  docs: kdoc: Centralize handling of the item section list
  docs: kdoc: remove the "struct_actual" machinery
  docs: kdoc: use self.entry.parameterlist directly in check_sections()
  docs: kdoc: Coalesce parameter-list handling
  docs: kdoc: Regularize the use of the declaration name
  docs: kdoc: straighten up dump_declaration()
  docs: kdoc: directly access the always-there KdocItem fields
  docs: kdoc: clean up check_sections()
  docs: kdoc: Improve the output text accumulation

 scripts/lib/kdoc/kdoc_files.py  |   4 +-
 scripts/lib/kdoc/kdoc_item.py   |  39 ++++
 scripts/lib/kdoc/kdoc_output.py | 331 ++++++++++++++------------------
 scripts/lib/kdoc/kdoc_parser.py | 162 +++-------------
 4 files changed, 218 insertions(+), 318 deletions(-)
 create mode 100644 scripts/lib/kdoc/kdoc_item.py

-- 
2.49.0

