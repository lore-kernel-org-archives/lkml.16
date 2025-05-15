Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8F25CC6C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333420; cv=none; b=q3SHgdPZsg10WsPUymo/FAGc1bgamxRd9GJEFYp5QxcGfYAWCzOYGU793/89KfUtl+oOToace6GKzC10sjgTK6EmAh0XDfewfWtbzekOvGl49Wq2tFEkFdzJVxfNfZTQhQ4aAiODkwNmf8/ZqHHevp/XyAEEkUfyTTsDDXoSgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333420; c=relaxed/simple;
	bh=YFtHT+k/XEwn8s8NbYSX++JEXBQzRYvhNkOkYu9LKk0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glG+NVv46dlCTf2NzaM0gJNrYyVj+ey4p1OMh4IzBUTB/Endrive1pzbU40sDSa+ntYfsZU92D+P2Q8xxKn72j/NyEXehKmvOFfadJPwWcqFzgg6a/AP405ojTDwME4H+95mcwnqVX4VlD2FuvWOgrcMSdMpv6mBpQ6x3sDYvSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=K1u6OD1t; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="K1u6OD1t"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476977848c4so14431281cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333417; x=1747938217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvA/5mmwvlyXjjShgPRe3HUQDr1iF9RhOznOEeKkVGs=;
        b=K1u6OD1tC/z948PdhYLTwJXf3WaC9biqAgscwCPwvRqg8tLWz+61Jpajcc+DlHFmWt
         F+S9b4r4+d4oMiYdu/BUyIW7J9C2SXdw1XhJtbAstx+Q5P0TOb7bILlNX17MzHuwtUJQ
         T+x1XFY8Kvpgf9ggijgQ6+uU0XPwJcJK8R9Giz07FAIhXxCAE7xbWADrj1AmTsCCN0wt
         vd5G2eoEpA/Bxza2yvgppvlvm7V9PlqoPIUgZnw9Gmmr1Ddo62cdLqbb5dA9gQSC2Zfk
         S6A6gM8dSNo3s53mY/Wr5N0vmijABCC5GZQ7rb6FS8gA3VcpG080nFKvnKIHdBZz/Obf
         UUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333417; x=1747938217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvA/5mmwvlyXjjShgPRe3HUQDr1iF9RhOznOEeKkVGs=;
        b=wyG0fS6Iqm7OQzq5AZGMpMq7oNZsF1vQEo3xIrYje9GpVAS2a6iTZa03dTtlhPlj3J
         PpbnCqij77efV4qwgsPL6dVzAlv3N7YZlC4QMVnpFWT7rgWdifKw08grqCAw6NRFKtHC
         iOa7mcXJMnaDk45CqWHN3+5kGbb+r7kWwmx0X1eWw7kci51KeTrQrc9c1Io96YNgW54w
         Pg7j+gRy8sHG2a8ekQ/Dl7YKKCC1QLup9k+X1eW+rvpuGynwy/L/sLiFYAL4cwN+y7js
         c1V/Quup4ezw7djHBp0qCWV66l0UNNAsyGw2Y2ZQ9+YNXietKtVLTRyWY//kfsrYOMes
         Hdng==
X-Forwarded-Encrypted: i=1; AJvYcCXhrnlMBOx0GHabJ8RLVpC5ZNrCaU1cOCrRVI4M2IFVZ1ZCpJtiz4qjZ65QmI4X/ttsWdsdPqqf+4MlF0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCruGUStnAxdBvkxZw1MwJMeYXXVSCoF8uvsYTyt3V0hMTj6JW
	+dxoPTDAnv9ysY+jrrl9J3rnRJZ2pEf3YO9LEn4ZEUV6TUnu8hUJvBFsIkWLoQhvQVA=
X-Gm-Gg: ASbGncu7ctBZLkXW7iVhtiTsCFYC3i6s0MJ54FaOYL6zUwhvWSJIFrRWfWhdLZ/G0GF
	oJufWWxXLXSbKK6btI4A656fWF5NVnsfwZbHps2Im71li6OKb5JSsT9uU1UBFlFSIDeMPnopkZq
	7VYYfOMMsejeh0iS2nvy6QAkLg4qAWFpjpFE2gjNhQ0DnhMfRiFv5DS230kL76si1nkAkIno5Ny
	1qzYItkRJB3vGKXxHxLvccokFa/bjzVzhpoY0oAVzph9yLz8x3+wuG/f9IwaQhT+Dk+ZfdFQDfF
	8CxZtvJT8f2JjRx87hdByuCQQUlE9Fmtorxt9pXW4B/rKVqM4l2txt5YAeZQWdOB/lW/FDbvJ3g
	UHiJUWN651V9QdPtaztoYkJ+Q1b5L1MrsAjlooIf/HLhH
X-Google-Smtp-Source: AGHT+IGwGfafVEqszpzHfVyT1n75QQOkLMjmW8/M2osA6KUoeC67c8MFcYHqA49j/QOV7cBeHjhLpQ==
X-Received: by 2002:a05:622a:4113:b0:477:e7c:a4c with SMTP id d75a77b69052e-494ae47d27fmr6871581cf.39.1747333417029;
        Thu, 15 May 2025 11:23:37 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:36 -0700 (PDT)
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
Subject: [RFC v2 07/16] luo: luo_subsystems: implement subsystem callbacks
Date: Thu, 15 May 2025 18:23:11 +0000
Message-ID: <20250515182322.117840-8-pasha.tatashin@soleen.com>
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

Implement the core logic within luo_subsystems.c to handle the
invocation of registered subsystem callbacks and manage the persistence
of their state via the LUO FDT. This replaces the stub implementations
from the previous patch.

This completes the core mechanism enabling subsystems to actively
participate in the LUO state machine, execute phase-specific logic, and
persist/restore a u64 state across the live update transition
using the FDT.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/liveupdate/luo_subsystems.c | 133 ++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/liveupdate/luo_subsystems.c b/drivers/misc/liveupdate/luo_subsystems.c
index 436929a17de0..71f5f0468b0d 100644
--- a/drivers/misc/liveupdate/luo_subsystems.c
+++ b/drivers/misc/liveupdate/luo_subsystems.c
@@ -99,6 +99,66 @@ void __init luo_subsystems_startup(void *fdt)
 	luo_fdt_in = fdt;
 }
 
+static void __luo_do_subsystems_cancel_calls(struct liveupdate_subsystem *boundary_subsystem)
+{
+	struct liveupdate_subsystem *subsystem;
+
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		if (subsystem == boundary_subsystem)
+			break;
+
+		if (subsystem->cancel) {
+			subsystem->cancel(subsystem->arg,
+					  subsystem->private_data);
+		}
+		subsystem->private_data = 0;
+	}
+}
+
+static void luo_subsystems_retrieve_data_from_fdt(void)
+{
+	struct liveupdate_subsystem *subsystem;
+	int node_offset, prop_len;
+	const void *prop;
+
+	if (!luo_fdt_in)
+		return;
+
+	node_offset = fdt_subnode_offset(luo_fdt_in, 0,
+					 LUO_SUBSYSTEMS_NODE_NAME);
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		prop = fdt_getprop(luo_fdt_in, node_offset,
+				   subsystem->name, &prop_len);
+
+		if (!prop || prop_len != sizeof(u64)) {
+			panic("In FDt node '/%s' can't find property '%s': %s\n",
+			      LUO_SUBSYSTEMS_NODE_NAME, subsystem->name,
+			      fdt_strerror(node_offset));
+		}
+		memcpy(&subsystem->private_data, prop, sizeof(u64));
+	}
+}
+
+static int luo_subsystems_commit_data_to_fdt(void)
+{
+	struct liveupdate_subsystem *subsystem;
+	int ret, node_offset;
+
+	node_offset = fdt_subnode_offset(luo_fdt_out, 0,
+					 LUO_SUBSYSTEMS_NODE_NAME);
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		ret = fdt_setprop(luo_fdt_out, node_offset, subsystem->name,
+				  &subsystem->private_data, sizeof(u64));
+		if (ret < 0) {
+			pr_err("Failed to set FDT property for subsystem '%s' %s\n",
+			       subsystem->name, fdt_strerror(ret));
+			return -ENOENT;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * luo_do_subsystems_prepare_calls - Calls prepare callbacks and updates FDT
  * if all prepares succeed. Handles cancellation on failure.
@@ -114,7 +174,29 @@ void __init luo_subsystems_startup(void *fdt)
  */
 int luo_do_subsystems_prepare_calls(void)
 {
-	return 0;
+	struct liveupdate_subsystem *subsystem;
+	int ret;
+
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		if (!subsystem->prepare)
+			continue;
+
+		ret = subsystem->prepare(subsystem->arg,
+					 &subsystem->private_data);
+		if (ret < 0) {
+			pr_err("Subsystem '%s' prepare callback failed [%d]\n",
+			       subsystem->name, ret);
+			__luo_do_subsystems_cancel_calls(subsystem);
+
+			return ret;
+		}
+	}
+
+	ret = luo_subsystems_commit_data_to_fdt();
+	if (ret)
+		__luo_do_subsystems_cancel_calls(NULL);
+
+	return ret;
 }
 
 /**
@@ -132,7 +214,29 @@ int luo_do_subsystems_prepare_calls(void)
  */
 int luo_do_subsystems_freeze_calls(void)
 {
-	return 0;
+	struct liveupdate_subsystem *subsystem;
+	int ret;
+
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		if (!subsystem->freeze)
+			continue;
+
+		ret = subsystem->freeze(subsystem->arg,
+					&subsystem->private_data);
+		if (ret < 0) {
+			pr_err("Subsystem '%s' freeze callback failed [%d]\n",
+			       subsystem->name, ret);
+			__luo_do_subsystems_cancel_calls(subsystem);
+
+			return ret;
+		}
+	}
+
+	ret = luo_subsystems_commit_data_to_fdt();
+	if (ret)
+		__luo_do_subsystems_cancel_calls(NULL);
+
+	return ret;
 }
 
 /**
@@ -143,6 +247,16 @@ int luo_do_subsystems_freeze_calls(void)
  */
 void luo_do_subsystems_finish_calls(void)
 {
+	struct liveupdate_subsystem *subsystem;
+
+	luo_subsystems_retrieve_data_from_fdt();
+
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		if (subsystem->finish) {
+			subsystem->finish(subsystem->arg,
+					  subsystem->private_data);
+		}
+	}
 }
 
 /**
@@ -156,6 +270,8 @@ void luo_do_subsystems_finish_calls(void)
  */
 void luo_do_subsystems_cancel_calls(void)
 {
+	__luo_do_subsystems_cancel_calls(NULL);
+	luo_subsystems_commit_data_to_fdt();
 }
 
 /**
@@ -279,6 +395,19 @@ EXPORT_SYMBOL_GPL(liveupdate_unregister_subsystem);
  */
 int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data)
 {
+	int node_offset, prop_len;
+	const void *prop;
+
+	if (!luo_fdt_in || !liveupdate_state_updated())
+		return -ENOENT;
+
+	node_offset = fdt_subnode_offset(luo_fdt_in, 0,
+					 LUO_SUBSYSTEMS_NODE_NAME);
+	prop = fdt_getprop(luo_fdt_in, node_offset, h->name, &prop_len);
+	if (!prop || prop_len != sizeof(u64))
+		return -ENOENT;
+	memcpy(data, prop, sizeof(u64));
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(liveupdate_get_subsystem_data);
-- 
2.49.0.1101.gccaa498523-goog

