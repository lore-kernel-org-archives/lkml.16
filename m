Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C7233707;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407114; cv=none; b=MN/8kOomTRknNqLUPSMzCCHO2NVfpkoiovZ8mihFnbGHR2rn9GYDLKQxYPVi1ulhYrOjC46PnDXA2xdGRjKhU4UIwsoS2Vaj9Zmx7SSYVfeAsEi9pJbn1zWIOksaYNPBdQ4f+/1PPhYNqmxx8MgvWIRzmg8e+KupCnnZkBHm8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407114; c=relaxed/simple;
	bh=CLs2CmKM6NXn99dbGan4xHxo1z2LDDHlcw8diMPBG5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJLnfP/B64DYQgSDa04rxOEJfio7mvb764o3NfC16oZU4lDLzEPoVVIKs0C8gy3YXlumYO9h9jHE8CkU4d6UwGUmZG6YWFcJ+wv4KJRoDfx9yT6VjLbuPPamFh05+t+qJM3vWg9erGeDvUHooJLPdFlrE7KGi5LDHiBoxvNju2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPL9qSjT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPL9qSjT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A74C4CEF3;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750407113;
	bh=CLs2CmKM6NXn99dbGan4xHxo1z2LDDHlcw8diMPBG5I=;
	h=From:To:Cc:Subject:Date:From;
	b=KPL9qSjT3AlF2YJQ5vCmUlz1h7OaPdqCu8mmfT5c+iclw2IwvBVrHHEYzjDtEZrge
	 sevRQAVoIa3d5rQMcBjR0in8JO4QL5/97IPpdSO0nhWAU51gy3XX4aGcXXgLn5XQ3H
	 wU5hImQLEgqFoARVWq+x8aoGBs/XaWF4PpHEuSI6tsiEtvR0RmqWtL6CBggAOSS2iJ
	 /5E4mBbTkzZyST8Ctn145p2FstPPZz7ZQgWK3oMzkfGXbEAIDJPAUZ36aH7UPXnaQB
	 ClbBwXklXtJ0dQSVMyWQx7HXzy/vc0XmJ9FCiGpgqWHA3Q3gGaM6qX9FlayS4nuseu
	 8bLyPk2ji9R0Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uSWql-00000004TWk-3Ei1;
	Fri, 20 Jun 2025 10:11:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Some improvements for the doc build system
Date: Fri, 20 Jun 2025 10:11:40 +0200
Message-ID: <cover.1750406900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This series contain some patches from my parser-yaml one that
aren't directly related to it. It basically addresses some issues
at the build system. It also adds a script that I wrote with the
purpose of checking backward problems when building against
older toolchains.

IMO, the best is to merge and apply it before the YAML series.

I'll be respining the YAML later, with some additional changes.

Regards,
Mauro

Mauro Carvalho Chehab (6):
  docs: conf.py: properly handle include and exclude patterns
  docs: Makefile: disable check rules on make cleandocs
  scripts: scripts/test_doc_build.py: add script to test doc build
  scripts/test_doc_build.py: make capture assynchronous
  scripts: test_doc_build.py: better control its output
  docs: sphinx: add a file with the requirements for lowest version

 Documentation/Makefile                    |   2 +
 Documentation/conf.py                     |  67 +++-
 Documentation/doc-guide/sphinx.rst        |  23 ++
 Documentation/sphinx/min_requirements.txt |  10 +
 scripts/test_doc_build.py                 | 382 ++++++++++++++++++++++
 5 files changed, 480 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/sphinx/min_requirements.txt
 create mode 100755 scripts/test_doc_build.py

-- 
2.49.0


