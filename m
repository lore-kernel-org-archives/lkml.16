Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF112F6FB8;
	Wed,  2 Jul 2025 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487269; cv=none; b=pkAw0b86rGGLEBpnjNEQ375XIcghYD7vUv7PRlS1hpZJeGztvxoytTbyuVeIr9gAyj9EFCC4kkaoVQM0TJDNIzTNC/WZDZ4mBOk2vfmmT7Ka+aHBgOsAfsQXxq0NOhTR6Mlja/4fNnNVqiy/UQ1tVI27Knr/jyX9NwWgLIbThPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487269; c=relaxed/simple;
	bh=u39v0zZeyjiQzeN38fl08Se0MVq9BWlAg6GHNyHASGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHqvWM5+zKQkDDjhnMbiHSwtfXEPw4c1GRWCpumhathgZrBQysy6+ci2mVoPvsqIkAbMnyoa+KpmlurehoCd32FSMaCeqhVhvL1ecFsfaVHD8BOZLiMGVwd4gZi2aWTFMaxNTEol5tghppKk3JCuBaZZhkr0dgAYZtB8EWJy8wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jC52YU/y; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jC52YU/y"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70f94fe1e40so3724957b3.1;
        Wed, 02 Jul 2025 13:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487267; x=1752092067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lrqRfIbiznaxiPBqXSvk2Fj8kr9UwyfETV9qJL2pdI=;
        b=jC52YU/ymUshWPmy3OJtKUuNWgIg45qx6PjLME2FIc/570Ke5rfPsr3396V+GN4TT+
         MH7miwYwuzRLXJeI2IeA9BodxIHPMtj0A6K6bcKYoEoc58sMn53bmptfY+J7zjdIzKfU
         yYO9XnDdq7nEzNOG3O5+2Jdw4ONgBAk8bKA524ly+OzjtcBvp4sYGjvGpjcwLfZ5tJfj
         z06VVSHA4JKSPcoCNaRtQAAe2tE9jZQQH9T1PatRDUojd9CJ7OIjoPvMKzfs9o2wRZ2P
         4NBSutlPXEvFOPFroqcuQqoZt1Jmi3jO1NxEIMtD/v63CIi179EU9ylN/ua48BeOHI0J
         Kbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487267; x=1752092067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lrqRfIbiznaxiPBqXSvk2Fj8kr9UwyfETV9qJL2pdI=;
        b=kiDdoxMRzYZ5vM/P7TCL34bk5KxunK3JpCFl6wkM4ifekonhB1Q2lNAK9ZJes/Dop8
         t0SDSoo87HusQgopHWFpKZ8mwzccDtpw4n25UriHTuAKEug3RCylReBAm3/HGK9do/w2
         6Z+unKI5HZGU0LpsIn71Xv2UkYecK3+sdQD7QiCTQNFmI3BJDhJ0cLA66xx47dv+QVK6
         aC+XDghOXYxwkzTtZCzyexm5VNvivONjHXCikSxKP/mWiKEriNDaPtu3Eoci8bCDt9BJ
         7vi6JR4E+E0GUpTcPSS+0m1/oL6HFhjbjHgCIlPYT6ZIcsq2rutpU7CEQXkxyQryHVLZ
         a1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVwMLmA6bAI6uPxUWY/0HX7uFhF6KraijjBsrQXUj+v3OpDbqft2nH+c/LMcJ1BXOiojDmadfC2ygc=@vger.kernel.org, AJvYcCXC/d7wlArxnGGJFxpMf07aylM9/SiZC+QY4PrAXoE82ErrsLZv1WW9Ru59KzpR27LmGFUuScmrpGz/teaT@vger.kernel.org
X-Gm-Message-State: AOJu0YzqX7MN9ld5aNXgUuHK/RCdhjkj2sj76Kfc22sMrnKKvv05Vz9l
	3owEzrClIQEQOx9XtioUiTmWu+ni4HxTY3Oc0nVuEqC1SD1ryMaEalB6XFUJx/ztfoQ=
X-Gm-Gg: ASbGncuVgyJX/z/RfsZXReaEHsXgohwhcZGpEdESwkgp6SGGPpmtHFL5lHXXgVAqrVR
	Z3bpccRGchNedC87/IdpVSDecKKYu7NO3aiJWYpAlnwMJyI4h1MICtmykPp3fB4krIwupCYt1Ux
	FFEeRMPbxsCzdd8Q/+QMVIYStjzpsvQd0+hD9lrgy//FX6Iu0cn/qjVBcW2A+/a0PS4k0q6uFqJ
	yGY83yDfVwM2/CVFOtX/fiFVYz35ibK411T6i2UeMD8LO5wjkh6givIHSUcV+hAJaY31YBGR1/F
	mgAoNq9bMZs0diW8j6xySATQb147qa/PikuuLEXMmeqMVIvAaFnRgeG24SL2Um0op58Ly7wMscV
	D2o702hA=
X-Google-Smtp-Source: AGHT+IGJzaqxYxk/z8axkYLbzkciZC3H6cDkoswua37kH/fx062ueaRa2kXVMDmpRDd/R39IV+DhUA==
X-Received: by 2002:a05:690c:6002:b0:703:b47a:7312 with SMTP id 00721157ae682-7165918c718mr14469857b3.15.1751487266879;
        Wed, 02 Jul 2025 13:14:26 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:26 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v3 05/13] Docs/ABI/damon: document schemes dests directory
Date: Wed,  2 Jul 2025 15:13:28 -0500
Message-ID: <20250702201337.5780-6-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: SeongJae Park <sj@kernel.org>

Document the new DAMOS action destinations sysfs directories on ABI doc.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 .../ABI/testing/sysfs-kernel-mm-damon         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
index 5697ab154c1f..e98974dfac7a 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
@@ -431,6 +431,28 @@ Description:	Directory for DAMON operations set layer-handled DAMOS filters.
 		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/filters
 		directory.
 
+What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/dests/nr_dests
+Date:		Jul 2025
+Contact:	SeongJae Park <sj@kernel.org>
+Description:	Writing a number 'N' to this file creates the number of
+		directories for setting action destinations of the scheme named
+		'0' to 'N-1' under the dests/ directory.
+
+What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/dests/<D>/id
+Date:		Jul 2025
+Contact:	SeongJae Park <sj@kernel.org>
+Description:	Writing to and reading from this file sets and gets the id of
+		the DAMOS action destination.  For DAMOS_MIGRATE_{HOT,COLD}
+		actions, the destination node's node id can be written and
+		read.
+
+What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/dests/<D>/weight
+Date:		Jul 2025
+Contact:	SeongJae Park <sj@kernel.org>
+Description:	Writing to and reading from this file sets and gets the weight
+		of the DAMOS action destination to select as the destination of
+		each action among the destinations.
+
 What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/stats/nr_tried
 Date:		Mar 2022
 Contact:	SeongJae Park <sj@kernel.org>
-- 
2.43.5

