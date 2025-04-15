Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFE1FDA9B;
	Tue, 15 Apr 2025 03:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744686799; cv=none; b=DdUv58e9OxOjcehd1qa5UyqyTxNo+sC+642mrFH+7FTyNFdmXsZHA1K/MG8ktuDKTEaoIDC1JTVa9otO9z1Dlupn6uhqSeOKc7/VoTtFjZQj0OqET18X4ukEE2L9EJ3ZbVsAaxPYvySXxjbBtgvY5X/HE1x/1LJxygZ3DaS2HWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744686799; c=relaxed/simple;
	bh=UjeHqeQ2RToxnX0xeeD3gg3Bvju/X/1QNQiHPVmCGSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/x4w7i+LQUd0mkwjCe3WPesW2yyR5VzDpdZcANplHqCdNtM1F4KoJ+1RvEoEgAPYDY8VokR3YbEBGRP7Z3Z5ppPdLcOEyq5V8zpGCpxDgQTRf8XEkMaWB4hANlU5piPDJhuVJcJ0gNYD3z00NqMkkSaXv6PjGqq5VWBXlErWD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RERlUtsH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RERlUtsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0248C4CEEA;
	Tue, 15 Apr 2025 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744686798;
	bh=UjeHqeQ2RToxnX0xeeD3gg3Bvju/X/1QNQiHPVmCGSM=;
	h=From:To:Cc:Subject:Date:From;
	b=RERlUtsHN+vONCTFDl/JX1dl7cBTjCblaF9Q1VInUR++3Oc/D4KeqLz3gWwwPG5aw
	 ct1IgRZ73VVQkZ9xfgsofghxs9H8BPaS3P2kdR7FE3mJqEr+zeG5B7hA7gLRDJeqvb
	 UWS60eK6F5GOlhanfuqzw7uX6hGaLZt5IRHvhHdXtXNNsyP0rntEEvkmDA8d0jvCm9
	 qaZ4tHV4dpQpJXQIHVw3om0H5iRMfXss//kq1DtImppLbTook7Lg/+HMpXiIXkuxjm
	 giZn2DFpXRlaf1g4K/H6zxFmVXC429Qq82cqLV33e4xMGOIZ4coBXfNTan9NCpmtOt
	 Brx7oueOzZdxw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4WjU-00000002FHA-3hfB;
	Tue, 15 Apr 2025 11:13:08 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/4] Improve Sphinx kerneldoc extension
Date: Tue, 15 Apr 2025 11:12:47 +0800
Message-ID: <cover.1744685912.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Hi Jon,

As promised, this series improves the Sphinx kerneldoc extension making it using the
kernel-doc.py classes directly if available.

The script still supports excecuting kernel-doc via shell, and, in verbose mode, it will
show the command line arguments to run kernel-doc manually, even when the Python
classes are used. The idea is that the command line verbose will help to eventually
debug issues if one needs to run kernel-doc.py manually. 

On other words, after this series, if one does:

	make htmldocs KERNELDOC=scripts/kernel-doc.py

Or, simply (as internally KERNELDOC is set to scripts/kernel-doc.py):

	make htmldocs

It will use the Python classes instead of running a subprocess.

If one uses, instead:

	make htmldocs KERNELDOC=scripts/kernel-doc
or:
	make htmldocs KERNELDOC=scripts/kernel-doc.pl

As the file extension doesn't end with .py, it will excecute the Python or the Perl
version of kernel-doc via a subprocess.

On this version, I opted to re-create the Python objects for every single kernel-doc
line, so no caches from past runs are used. I'm working on a version that will cache
results, but it is currently causing some regressions. So, let's do the changes
step-by-step, applying first this improvement patch series.

PS.: the first patches on this series are addressing some some bugs and one
improvement that I noticed while debugging the patch changing kerneldoc
Sphinx extension.

Mauro Carvalho Chehab (4):
  scripts/lib/kdoc/kdoc_files.py: don't try to join None
  scripts/lib/kdoc/kdoc_parser.py: move states to a separate class
  scripts:kdoc_files.py: use glob for export_file seek
  docs: sphinx: kerneldoc: Use python class if available

 Documentation/sphinx/kerneldoc.py | 138 ++++++++++++++++++++++++++++--
 scripts/lib/kdoc/kdoc_files.py    |  11 ++-
 scripts/lib/kdoc/kdoc_parser.py   | 119 ++++++++++++++------------
 3 files changed, 200 insertions(+), 68 deletions(-)

-- 
2.49.0


