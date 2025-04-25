Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B4191;
	Fri, 25 Apr 2025 00:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745539752; cv=none; b=KIr3GgjIQ9+lLNTtR9C04vo/U7Uo2E8sU/hpUj0s7uCNN+9Q+dwHRN9p9C1PC6nmlLcrJtVQWQ9J96n188jCEhfGDsZVIxxzXVMDfdTUbJTv/CG/bzWfetxPNB5LcmPytQt4Tc+Kmsv3bnqYlpMbgeT5zzi9rj7rNR1HmS8GdHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745539752; c=relaxed/simple;
	bh=GgKzI3SjL7IO9hK0gjAK5lyJs/gVjGQ7EGHIGAKVuRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EWE0eF3YfQV/nNRxPy0yzdEDKC8HHBDAYCZdDQk1N4RefuNui4KWJvPzyJW0zU48uypcjUpge/46rhSHZC69oYgzyq0XHr2BaPYcB/cUvYmNwqG8kCk7eXGbR9eLqCy8lTnPe+JHFoyyOqFaHBDNmKeQ5bWA2IjnWf/ZuJMURRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8v7zU8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8v7zU8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738DFC4CEE8;
	Fri, 25 Apr 2025 00:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745539750;
	bh=GgKzI3SjL7IO9hK0gjAK5lyJs/gVjGQ7EGHIGAKVuRc=;
	h=From:To:Cc:Subject:Date:From;
	b=R8v7zU8ObxuYVAQ3Q4g0QBXzLFdeIyyQAccoc5WFhCJRUHHk8/kKIqSPB7gHTcFGo
	 cw8aZDmZCKmnTMbm9dhS0a61DWc1qbTaKQqil+f/WrCsjprwx9gN7N09TWWXtOjlz9
	 rLDV41yVwgbYmS9J5tpcP/A27A7xbuese8mbrKI7aDxS42EE2xiy8mKgwPWLknDrMe
	 G8X9NWcpfApQ08qDrwsR25fQ1Q2Q8/qVxHbzd/QJdPYAUfEDE8D6hikCYmLUXUyxGv
	 6G3gvD8Z9w0SK5dJN44emSp2hzHQVUJV7ywibgpxGGTWme8C2V9b1FY3UgS9wgPgW9
	 jgbPqV2TtUGIQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u86cp-00000000R1b-3L62;
	Fri, 25 Apr 2025 08:09:03 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 0/1] Let Sphinx store cached bytecode under the output dir
Date: Fri, 25 Apr 2025 08:08:52 +0800
Message-ID: <cover.1745539360.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Hi Jon,

I guess we can also apply this one. It works fine for documentation, as
it will store the __pycache__ directory under Documentation/output,
and should properly honor O=, as this is already handled by the doc
output logic. Also, make cleandocs will remove the entire output dir,
including the bytecode files and dir.

So, this should work fine for us.

IMO, we still need a generic solution to cover the other cases where
we're using PYTHONDONTWRITEBYTECODE=1, but, as on Sphinx
there are 634 temp files, this could hopefully speedup doc builds
a little bit on slower machines and/or when one is just rebuilding
docs with small changes.

Mauro Carvalho Chehab (1):
  docs: Makefile: store __pycache__ at the output directory

 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0


