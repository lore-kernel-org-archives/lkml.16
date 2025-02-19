Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6325B1D14FF;
	Wed, 19 Feb 2025 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953972; cv=none; b=tYzshy14wTrNwDVqZknj4wpvP0HmhmR8upRXerPF2kbWJx1liclYNSi2toZG60CHr5jwC4pipiSEwU3l6w4/uG16smnnk/RxSuRyPRFIF38sryv7PPIEZdAxP8NR3e2zC2ymPM6+2/Oc3MDfeds3YX7+MWkeyl7VBAYZp6tGPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953972; c=relaxed/simple;
	bh=pT2AurFk7T5HHxyb+zGbm0v00i4Pdq52KmG0zBAistg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fxn/zPcFxhCEjaFX8C2Ga+TH24vFXHgSQSaeh/ICyek8HJx7kPlGoJN2YKynw6LxZHQ24eLT0+7Au37YVoueaO7yRqQV13e4SGU0N5rc727Qu/m8DG1/H14elF0tkukMX76bI88ve98oEJtI//Kr5AKivcMYhBJC46bcswnV5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2F9GMBc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2F9GMBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A69C4CEF1;
	Wed, 19 Feb 2025 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739953972;
	bh=pT2AurFk7T5HHxyb+zGbm0v00i4Pdq52KmG0zBAistg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2F9GMBcCheO8BiQlvKnIJ1rvxtjLAHCEGJnVAst4BwdM3+xx6Ts2jo0OT6YfdKxm
	 AwYTjMhTmODYeb1h6oS23wXDaYyB81be7ZPivtSnz3iFFf54qS5Q9e3SdxKQLUcu4x
	 xDFoj8x7sonE9xKkvFvwPCKlOXafI0iNE86BB2bkXs/dsDCBMxUy/0rcw7fy6J2Byz
	 EfqK9zLuXlVdDtihhhBNDOBCg/czYHcaVLfPdP/a5NzPbS/JZJLR9mCm2Z9NcXEEdl
	 pwIfxpw/qDqMOGGtzvScRClVzK6TQFqPGhCGCD8v8FPfDhTMeXaMiBGDuPpAMRv+FQ
	 BBHLIZRtAFIGQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tkfVi-0000000Gv4j-0SY5;
	Wed, 19 Feb 2025 09:32:50 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/27] scripts/kernel-doc: rename it to scripts/kernel-doc.pl
Date: Wed, 19 Feb 2025 09:32:23 +0100
Message-ID: <a3635c91be0a61be308bc56ea0127abb32593e70.1739952783.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739952783.git.mchehab+huawei@kernel.org>
References: <cover.1739952783.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In preparation for deprecating scripts/kernel-doc in favor of a
new version written in Perl, rename it to scripts/kernel-doc.pl.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/{kernel-doc => kernel-doc.pl} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{kernel-doc => kernel-doc.pl} (100%)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc.pl
similarity index 100%
rename from scripts/kernel-doc
rename to scripts/kernel-doc.pl
-- 
2.48.1

