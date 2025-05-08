Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF91ACED7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693048; cv=none; b=CRkrc0wbXIEpJiSvmdsWWurlUePdz+oSKLyv1/4jTVHJ5aNWQ19VVruj9JrGMFH2X3DYRvkT974684Psq1B8YWP8THkOqDDbeMgfCmPo4aIG5zdK1B2dWFoaWuLY2PtcoLX2NaPvejYrtnJw8zoy69Q+5crqjkhui5U2p4+zVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693048; c=relaxed/simple;
	bh=djE+Zh2QhDM34uc8sPlq4flT8Ezs6KE0DV3bU/bHg9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIEoSt/A/u/X5wD/TQGIST+42YaNZiiPcdHHC2XKL1IDu/MQl1bk+diXFVtDKqhcCHpbRXHhkwvTALn3N1JXiSRpIfHBOlJs3kZqlirwjyhiUrZHBtbHhl2ZsnPqYFKyWglSgYCmcl85fmD+EMh4OfzUUeb6bWhPZ0UMLhi3Izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HHM+utRH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HHM+utRH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a8fd40723so754349a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746693046; x=1747297846; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qg3iNzAHxO1ssP3cCs+yldNF00Pr/dpTQc2LD20rg0s=;
        b=HHM+utRHdL0kCWf6FQn9tpcWylRtC8gv5/yBgCOaQ2d/HIE7Zuju/FiFMa9zcZ9/lX
         yQsd4RKU2KNToyM9ZrRhQx254S6CL6HcAkyUYAkHmAxzWrtCqe7czMT3U+LkpExERFNL
         l8tz3NYTsTbJYw8t0rTPZIdB2aAQFDkJd/y5/FHYDU9ph92XOtnt+LYXhzEILJnk4qbD
         LhmLxWqEr8MTxMiWKyD8Rnr10+VeiL/g2Rn3Fqj+3YKcF/qqIbyL/9fWaeIhIckk2XSw
         Abko2XGoVJ3SjXSW1nN8/PidjOLplKQzjLmAsz0QQJz/Sqg9Gt6WU/DtW7olcyLh491I
         K6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693046; x=1747297846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg3iNzAHxO1ssP3cCs+yldNF00Pr/dpTQc2LD20rg0s=;
        b=Qe8RD3q2FO3lAGpt8Gcpk+O3ugh++ZZC2ZYiXHGL0ZJ3LFvS/CabjtfhIrW2e4ILyf
         hgu1b06xd5jGHL7Mx9fyxFVXImSqUlxcyZKcqadAzh9khM24+mEcK4pWm4vN0L8NGVhV
         dDf8aSD+rdJKJtus+tdw4zdy1yQ2pzXrLnNyVc1/wKdWOA5piLj6NzCJdBqJgIw/R9EJ
         Q+lHx7khWZcQtoPbHoG4m7uBKVn/XrMYby16W8LeoceXrhEJIZ/ELZz1Oq1j+xdFELfG
         1VlamsXO60W7pl6TTWcT77qquu8Mc1TzGqt/BvW4CB3RREb1zkvARgHULaP85XKqtZYV
         Y08w==
X-Forwarded-Encrypted: i=1; AJvYcCWMfACN1mOcYZuz3f7rXpAR1Nxx3aUxQr0z8q5kC6zo5iFrjgyU0VHc7d+uOoLz41M5jWySEPipiHpz2xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4NUfKsGdd70HPiIcH+CZxdh82qb25hnwzzIa/3u4na7tjoUx
	rDcdFVcnHhh0uF3TlJnc/R8xWGIFCJM43qv/eu0KFfDYP7SB3/rVgJ8f8FoHsA==
X-Gm-Gg: ASbGnct1rMXDGcWebTT4d/ezr6XxFmtZyO3uYOL5hzxjc3Xof5+eRd79hoVN0LmCn7Y
	4l9rCQV0NQjVPYgLVOgwULgfV9w0yRmojh4/WivXCKnw9sMAVwmrLBSgiZFX1ifQsOnTB2YApf1
	QUKqZ89+mUAa0RnFyAZG0Y09FNqLQWMwzznhggjcJND/mc6hcDIce0HGHfqQxI9E5GXcEQ0HKyI
	mU4DIet03O0WPE5Cn2JkUDh5p6ahE+6oeFkEVN+Sqn4Fetp407dM4WpSJoDjXD09vZR4wQgOuoj
	lTTOEE61T7KIwYKQ752fPuyGm/pqtoVbBoVS59u9
X-Google-Smtp-Source: AGHT+IERVr1KtdzcrRrNuFCo/sAAeq0g6uERPey1NFy1lXFkYYDkSmbIC+PFR0sYwk8FwWn/Pn0LxA==
X-Received: by 2002:a17:90b:1d8a:b0:30a:2173:9f0e with SMTP id 98e67ed59e1d1-30aac2498ccmr8223508a91.32.1746693045929;
        Thu, 08 May 2025 01:30:45 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522948csm107344415ad.159.2025.05.08.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:30:45 -0700 (PDT)
Date: Thu, 8 May 2025 16:30:36 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Kexin Wei <ys.weikexin@h3c.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] block: remove test of incorrect io priority level
Message-ID: <20250508083018.GA769554@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ever since commit eca2040972b4("scsi: block: ioprio: Clean up interface
definition"), the macro IOPRIO_PRIO_LEVEL() will mask the level value to
something between 0 and 7 so necessarily, level will always be lower than
IOPRIO_NR_LEVELS(8).

Remove this obsolete check.

Reported-by: Kexin Wei <ys.weikexin@h3c.com>
Cc: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
v2:
Address comments from Damien Le Moal, thanks.
- Rephrase changelog as suggested by Damien Le Moal;
- Remove an useless break for IOPRIO_CLASS_BE as suggested by Damien Le
  Moal.

 block/ioprio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block/ioprio.c b/block/ioprio.c
index 73301a261429f..f0ee2798539c0 100644
--- a/block/ioprio.c
+++ b/block/ioprio.c
@@ -46,12 +46,8 @@ int ioprio_check_cap(int ioprio)
 			 */
 			if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_NICE))
 				return -EPERM;
-			fallthrough;
-			/* rt has prio field too */
-		case IOPRIO_CLASS_BE:
-			if (level >= IOPRIO_NR_LEVELS)
-				return -EINVAL;
 			break;
+		case IOPRIO_CLASS_BE:
 		case IOPRIO_CLASS_IDLE:
 			break;
 		case IOPRIO_CLASS_NONE:
-- 
2.39.5

