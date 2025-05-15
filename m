Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB54E266577
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333422; cv=none; b=bMJK1Vd+apO/pGMICqKXkHygXfAKOdXWsSMtLUnUw2iRIAZwI/DwGLDNrTeNQDRRC+wOBhnx+f0mLSmqzVhx63jA9OmNZ2bc0B/s8/x6xovCFrnTYBV4ny14rStum604STWab2mGjlqBpjHtcVgGdzKvhy5jXO70FvUDqlKeo8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333422; c=relaxed/simple;
	bh=ZYEq4Qh4meJf6SEZCS3Xk5gBfGj3zxwgCJBcjhweYoU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naF1yOnzA+3QbaOjvhwISB+i5IvB37EuMG/BHn5MdGmc8ccgjXLon+52OHVp8dZFbs6aMDA7y4EEvwSVHoXDpZPPr15chN1QHgB/r9V/KtdTicqXRqc+XnsThaI1FgZgvU364GbSnv0huaTSb0IrGzvg8KEo+pcgs40z/2TULnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TQLytnyf; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TQLytnyf"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c53b9d66fdso164122085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333420; x=1747938220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fncEWK+MZKkah5dMCpMCDEnPbBrReOK9LaFvpIbRDZQ=;
        b=TQLytnyfACZ56nAAqaoOX78fcOuFFDmiGBvnbS0FKD3oubWur/q/pjixqE76OSVC6N
         z1ZsrpqmTWWUKJpKUC8g7fBXP4mmfx29UBp9S+S3rnriSaakHljr/skqBoUcHNf2TYv1
         NzV5IUHmtftA/KMxB81fFVpnCRBz+hMXm5u+0pSpUm6STcaU06epA6HhEPDvf5nOpsbp
         7XGmml+7T8wH2EX49yJEwTzyPdS0+5Y80Z2KQ5Vt1uOf00e8aFB43NnUZsKPVucxupMs
         CpnnuwhtAfx98nFbPxMcgEMrKPAEclpEk+I/8bu7a9eWinwDVRkQCsg5yTxOJBLJvTTU
         CnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333420; x=1747938220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fncEWK+MZKkah5dMCpMCDEnPbBrReOK9LaFvpIbRDZQ=;
        b=a2jht05Wv9152FC+5a77fLYH00toq48asHYbz/0Rg2sMYXTfKTjQlLgJzHP1qoh4Vf
         GG3C9Uv/DmzeiQ2w2Lz1+B4FITw0zuKbVVTsFh+zginwV3kIsbyxR4uOTB9qAE4tumG/
         p/oHfxVAUzvnaXpQElT5UBKUfx6lru6Q13Z/BbfF21vfTYQPdwBFSGmrdJk0JZeIGPjL
         a+pSBzTp7pP6rNAOK1qda9FhgmnOZXmaDYEzBMA3CluKgzMLYSCo5ViDJN9TGhJPsV2w
         3J3iZI4BjSPIJI6kP5A9uSA3qCUR9Dd2zqDszLVLDc3J57R8kp1Fs+s/WSM1+nbqXAMe
         FbQA==
X-Forwarded-Encrypted: i=1; AJvYcCVV0WeW4pOp36N6DpGyFEmC83SFZZMgTtMuonEo6cTjVl4Aqaly5cyd1wwI5C4s1RdaZBBpFtHiRRMnz2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfxv77xXzjbecgXdl/l5Xwpiz84EM2DK/CCrHZsW4gGHThRG/6
	rZopIrfBzXtr33pYrTqADrmpTCQdqbMvQgUdpOruAhGpd1a/fSCLgeoVKUJAAgfYrpU=
X-Gm-Gg: ASbGncth6akzPy8T249s2/4olrK+BkLgQON70DOce4+XL4/BkZtf8N1UKBlUx4GKYmW
	y41VdTvWQiFoNEoYslA+1qOA15pPGji1wjFKwBbWGZ2dWRuHxKw/LwPVfU3aQiWsgqfhAod2vNz
	iJbWyBbEcj5wDrf/7e7iGDsOZlXdIOa7EN1GQPsn1sHXrbZUII+X5T0HAwYm1nL+ngvRVqh9IIg
	ENmwh1OhYh1Fj9yIialKWZEyUinmOvSU05gKbNv0oSsXdleBtoNj9OGItyfc9WMxWjjidmDArlR
	Gi4LQY9CPONnpMLzwjoS2CBBWAnRcwZiQU+jZ9RoAwWZdoWCok6JdADeZxgvrkp9oPiVawEx4z7
	SxL7htFFdrgA9Q5Ko3Ymi9GK8URTVglyDCDP7i8BBTuo0qMh5wo0iwqw=
X-Google-Smtp-Source: AGHT+IF6BdiwFI8/g0r4fDQt5wq8NzbRLR+StKi364/jhbEBEOuKAsf85B0QaQPF6JgbzPbIYHnMjA==
X-Received: by 2002:a05:620a:24d6:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7cd46792d1dmr78474085a.36.1747333419419;
        Thu, 15 May 2025 11:23:39 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:39 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
Date: Thu, 15 May 2025 18:23:13 +0000
Message-ID: <20250515182322.117840-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements the core logic within luo_files.c to invoke the prepare,
reboot, finish, and cancel callbacks for preserved file instances,
replacing the previous stub implementations. It also handles
the persistence and retrieval of the u64 data payload associated with
each file via the LUO FDT.

This completes the core mechanism enabling registered filesystem
handlers to actively manage file state across the live update
transition using the LUO framework.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/liveupdate/luo_files.c b/drivers/misc/liveupdate/luo_files.c
index 953fc40db3d7..091bf07e051a 100644
--- a/drivers/misc/liveupdate/luo_files.c
+++ b/drivers/misc/liveupdate/luo_files.c
@@ -272,6 +272,48 @@ int luo_files_fdt_setup(void *fdt)
 	return -ENOSPC;
 }
 
+static void __luo_do_files_cancel_calls(struct luo_file *boundary_file)
+{
+	unsigned long token;
+	struct luo_file *h;
+
+	xa_for_each(&luo_files_xa_out, token, h) {
+		if (h == boundary_file)
+			break;
+
+		if (h->fs->cancel) {
+			h->fs->cancel(h->file, h->fs->arg, h->private_data);
+			h->private_data = 0;
+		}
+	}
+}
+
+static int luo_files_commit_data_to_fdt(void)
+{
+	int files_node_offset, node_offset, ret;
+	unsigned long token;
+	char token_str[19];
+	struct luo_file *h;
+
+	files_node_offset = fdt_subnode_offset(luo_fdt_out, 0,
+					       LUO_FILES_NODE_NAME);
+	xa_for_each(&luo_files_xa_out, token, h) {
+		snprintf(token_str, sizeof(token_str), "%#0llx", (u64)token);
+		node_offset = fdt_subnode_offset(luo_fdt_out,
+						 files_node_offset,
+						 token_str);
+		ret = fdt_setprop(luo_fdt_out, node_offset, "data",
+				  &h->private_data, sizeof(h->private_data));
+		if (ret < 0) {
+			pr_err("Failed to set data property for token %s: %s\n",
+			       token_str, fdt_strerror(ret));
+			return -ENOSPC;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * luo_do_files_prepare_calls - Calls prepare callbacks and updates FDT
  * if all prepares succeed. Handles cancellation on failure.
@@ -287,7 +329,29 @@ int luo_files_fdt_setup(void *fdt)
  */
 int luo_do_files_prepare_calls(void)
 {
-	return 0;
+	unsigned long token;
+	struct luo_file *h;
+	int ret;
+
+	xa_for_each(&luo_files_xa_out, token, h) {
+		if (h->fs->prepare) {
+			ret = h->fs->prepare(h->file, h->fs->arg,
+					     &h->private_data);
+			if (ret < 0) {
+				pr_err("Prepare failed for file token %#0llx handler '%s' [%d]\n",
+				       (u64)token, h->fs->compatible, ret);
+				__luo_do_files_cancel_calls(h);
+
+				return ret;
+			}
+		}
+	}
+
+	ret = luo_files_commit_data_to_fdt();
+	if (ret)
+		__luo_do_files_cancel_calls(NULL);
+
+	return ret;
 }
 
 /**
@@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
  */
 int luo_do_files_freeze_calls(void)
 {
-	return 0;
+	unsigned long token;
+	struct luo_file *h;
+	int ret;
+
+	xa_for_each(&luo_files_xa_out, token, h) {
+		if (h->fs->freeze) {
+			ret = h->fs->freeze(h->file, h->fs->arg,
+					    &h->private_data);
+			if (ret < 0) {
+				pr_err("Freeze callback failed for file token %#0llx handler '%s' [%d]\n",
+				       (u64)token, h->fs->compatible, ret);
+				__luo_do_files_cancel_calls(h);
+
+				return ret;
+			}
+		}
+	}
+
+	ret = luo_files_commit_data_to_fdt();
+	if (ret)
+		__luo_do_files_cancel_calls(NULL);
+
+	return ret;
 }
 
 /**
@@ -316,7 +402,20 @@ int luo_do_files_freeze_calls(void)
  */
 void luo_do_files_finish_calls(void)
 {
+	unsigned long token;
+	struct luo_file *h;
+
 	luo_files_recreate_luo_files_xa_in();
+	xa_for_each(&luo_files_xa_in, token, h) {
+		mutex_lock(&h->mutex);
+		if (h->state == LIVEUPDATE_STATE_UPDATED && h->fs->finish) {
+			h->fs->finish(h->file, h->fs->arg,
+				      h->private_data,
+				      h->reclaimed);
+			h->state = LIVEUPDATE_STATE_NORMAL;
+		}
+		mutex_unlock(&h->mutex);
+	}
 }
 
 /**
@@ -330,6 +429,8 @@ void luo_do_files_finish_calls(void)
  */
 void luo_do_files_cancel_calls(void)
 {
+	__luo_do_files_cancel_calls(NULL);
+	luo_files_commit_data_to_fdt();
 }
 
 /**
-- 
2.49.0.1101.gccaa498523-goog

