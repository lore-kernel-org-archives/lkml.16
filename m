Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66593264619
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333417; cv=none; b=c7Hr2+Lv4tSKPLQ/MD1XfiJYR/Apek1F1j1Ajxe21YmpM8ewp4vHDO4nVCZqV7Ue9ySF3sLsBbUytO0y/IfmlF3ovC3N86BT2vV0e6LmzthNL2m1ktBlZpQgDho+Pak9+mDyHUgK4YOYOV8f8YzWp4tvL3WGZqyOd7orPmcw+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333417; c=relaxed/simple;
	bh=yAO+FqUyXW7TfElH7NH7lyIDYXIQ35zp42uQgPAFqsQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCdzSJkVHoCmkwdJrYRQs18v45lrRotwszTytEA0ySBM+DBzWsVLCJKcFtXYOvCZqnOk5+O/wGvf/GImM+goTjGAKntEAV2aqBM75UmzeXAyIy3/oCLsj+gw3VJ0VIdN0/PMOfOm8Ww6VXOwk0bjfnaTawnscoKeySUvzpu04Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TrH07SJN; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TrH07SJN"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5f720c717so289341085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333414; x=1747938214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCL7Dl0fUJFgtoGMLDnQRSnzltXuASvUYx206SfRPVk=;
        b=TrH07SJNhzLdVUVOGu4NklRcvKaqoBTDkKextkucNU18kK0wOO8sIAqGmIgE3a1Y9J
         2vm87tHhL+XSJfaRh/wDN/FDd4c2P9u/N4cq3HC4A/NPcL+QOi6ygttFW1DqUuT9npqF
         BxudGjquI0JMxyCclkN7LObaVLDwK8r/l+CAg0osdwZJGsyBeXgrEpQBGUfIiTri6olE
         /WS4jiUe3NHPlGk2KA25RI2Mj4q+uwGotTYrcnp/2vtzlV3ShhcKaMv7AnFajfLvGTAZ
         6TorKoLonZ7w9D720Vw2TVyQP+KysTLe18W0H3QDD/rWL9lGg21uVzX7b1xpONCTRwA6
         Wwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333414; x=1747938214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCL7Dl0fUJFgtoGMLDnQRSnzltXuASvUYx206SfRPVk=;
        b=h2gSIPC+YoTF0vzbAfMc+SR4BXRAIpQ5UKxnHcVxNEdYXKDEmSTCrbl0kiIEGXWe2p
         I/B2l4qDezaSw33S5nbaCzvhvHfyaHer/13RxNY4gCCCFFtsdQYvGqHk4GyErQuq5+BR
         s9OGp8SGGD+mh4TEYwj5V2QnPrqEO0UwEhHpWIgnTC8Yg/0vjiZGeUp8g4Tz7CKNF4BQ
         1mYaWMl4XqBgKEEAYzvNRxBrIjeUeZgC/PiZEX/g4Fy0f0yVWocKwunLG1ZhyShYVlFp
         /hL4UE8W2bWYzFzmkoyKZQ+KAWstacKkOz70GtvrAQLq12Fq3hU7T07G3x7rTZ7OdtOT
         GBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVppVTyLjJDFW7dpRl0KDxg6FzXKYuhHypzsF6tCuDUfyG99Wx424pS/4PVjmHSWhsXimOu7jG2JF5bS7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBiLi46rFwD3TcOlvTn+K7SXBHQcHULYeEjivK1eQJtjj4CeMD
	QAIacY1sEVlxt2HBkLYvj+hBAVGphp0oba+/PMJX74+podgJTRAzZDagIrk+5qrg/1w=
X-Gm-Gg: ASbGncuKid3sWD/ETJvEUKXUm5sOeb/t45CReGAAFSK4jfNedBHUE865send2vO3WsN
	JXH++1h4dtc3fVTlcwHLFTKF/X+BP7OF/2KlDg6mYCCj1FxkDh8pqCt4DSHkkzMj9v/B1GF42bu
	y6IZvwfQPTXdiSD5MGRaTS6CE8iee6TKvpe7E2tx9jecrgcw6FBVbxNhlxJH7y23YhalSWl1NAV
	ME3KGIf0W6MetCXUq1teWkcDc7jZtBBLFRZlt9clESx6wTE+/EhZDvI2WXCLwWGo7nZdF3XnC3c
	5yWP3gVU6u73gCuLRE5v0+ckB7vwz6LcpXjs0rZZQSx6YjnCPW0Y6C2M0MyY+PEuoaar/Q6iyWP
	sX9DP863pbWmMMnaup610bCVsDBgbUHAputFAOC+Epfjo
X-Google-Smtp-Source: AGHT+IGyVx7YT2wET1Kp1qNiBNOANi4Vf79w65s/UaK8dJtraKWXto4zccTg9syrNS2nds1eQAId/g==
X-Received: by 2002:a05:620a:2890:b0:7c9:65cb:6214 with SMTP id af79cd13be357-7cd46b14da4mr55322585a.17.1747333414011;
        Thu, 15 May 2025 11:23:34 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:32 -0700 (PDT)
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
Subject: [RFC v2 05/16] luo: luo_core: integrate with KHO
Date: Thu, 15 May 2025 18:23:09 +0000
Message-ID: <20250515182322.117840-6-pasha.tatashin@soleen.com>
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

Integrate the LUO with the KHO framework to enable passing LUO state
across a kexec reboot.

This patch introduces the following changes:
- During the KHO finalization phase allocate FDT blob.
- Populate this FDT with a LUO compatibility string ("luo-v1") and the
  current LUO state (`luo_state`).
- Implement a KHO notifier

LUO now depends on `CONFIG_KEXEC_HANDOVER`. The core state transition
logic (`luo_do_*_calls`) remains unimplemented in this patch.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/liveupdate/luo_core.c | 222 ++++++++++++++++++++++++++++-
 1 file changed, 219 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
index 919c37b0b4d1..a76e886bc3b1 100644
--- a/drivers/misc/liveupdate/luo_core.c
+++ b/drivers/misc/liveupdate/luo_core.c
@@ -36,9 +36,12 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/err.h>
+#include <linux/kexec_handover.h>
 #include <linux/kobject.h>
+#include <linux/libfdt.h>
 #include <linux/liveupdate.h>
 #include <linux/rwsem.h>
+#include <linux/sizes.h>
 #include <linux/string.h>
 #include "luo_internal.h"
 
@@ -55,6 +58,12 @@ const char *const luo_state_str[] = {
 
 bool luo_enabled;
 
+static void *luo_fdt_out;
+static void *luo_fdt_in;
+#define LUO_FDT_SIZE		SZ_1M
+#define LUO_KHO_ENTRY_NAME	"LUO"
+#define LUO_COMPATIBLE		"luo-v1"
+
 static int __init early_liveupdate_param(char *buf)
 {
 	return kstrtobool(buf, &luo_enabled);
@@ -79,6 +88,60 @@ static inline void luo_set_state(enum liveupdate_state state)
 	__luo_set_state(state);
 }
 
+/* Called during the prepare phase, to create LUO fdt tree */
+static int luo_fdt_setup(struct kho_serialization *ser)
+{
+	void *fdt_out;
+	int ret;
+
+	fdt_out = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
+					   get_order(LUO_FDT_SIZE));
+	if (!fdt_out) {
+		pr_err("failed to allocate FDT memory\n");
+		return -ENOMEM;
+	}
+
+	ret = fdt_create_empty_tree(fdt_out, LUO_FDT_SIZE);
+	if (ret)
+		goto exit_free;
+
+	ret = fdt_setprop(fdt_out, 0, "compatible", LUO_COMPATIBLE,
+			  strlen(LUO_COMPATIBLE) + 1);
+	if (ret)
+		goto exit_free;
+
+	ret = kho_preserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
+	if (ret)
+		goto exit_free;
+
+	ret = kho_add_subtree(ser, LUO_KHO_ENTRY_NAME, fdt_out);
+	if (ret)
+		goto exit_unpreserve;
+	luo_fdt_out = fdt_out;
+
+	return 0;
+
+exit_unpreserve:
+	kho_unpreserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
+exit_free:
+	free_pages((unsigned long)fdt_out, get_order(LUO_FDT_SIZE));
+	pr_err("failed to prepare LUO FDT: %d\n", ret);
+
+	return ret;
+}
+
+static void luo_fdt_destroy(void)
+{
+	kho_unpreserve_phys(__pa(luo_fdt_out), LUO_FDT_SIZE);
+	free_pages((unsigned long)luo_fdt_out, get_order(LUO_FDT_SIZE));
+	luo_fdt_out = NULL;
+}
+
+static int luo_do_prepare_calls(void)
+{
+	return 0;
+}
+
 static int luo_do_freeze_calls(void)
 {
 	return 0;
@@ -88,11 +151,111 @@ static void luo_do_finish_calls(void)
 {
 }
 
-int luo_prepare(void)
+static void luo_do_cancel_calls(void)
+{
+}
+
+static int __luo_prepare(struct kho_serialization *ser)
 {
+	int ret;
+
+	if (down_write_killable(&luo_state_rwsem)) {
+		pr_warn("[prepare] event canceled by user\n");
+		return -EAGAIN;
+	}
+
+	if (!is_current_luo_state(LIVEUPDATE_STATE_NORMAL)) {
+		pr_warn("Can't switch to [%s] from [%s] state\n",
+			luo_state_str[LIVEUPDATE_STATE_PREPARED],
+			LUO_STATE_STR);
+		ret = -EINVAL;
+		goto exit_unlock;
+	}
+
+	ret = luo_fdt_setup(ser);
+	if (ret)
+		goto exit_unlock;
+
+	ret = luo_do_prepare_calls();
+	if (ret)
+		goto exit_unlock;
+
+	luo_set_state(LIVEUPDATE_STATE_PREPARED);
+
+exit_unlock:
+	up_write(&luo_state_rwsem);
+
+	return ret;
+}
+
+static int __luo_cancel(void)
+{
+	if (down_write_killable(&luo_state_rwsem)) {
+		pr_warn("[cancel] event canceled by user\n");
+		return -EAGAIN;
+	}
+
+	if (!is_current_luo_state(LIVEUPDATE_STATE_PREPARED) &&
+	    !is_current_luo_state(LIVEUPDATE_STATE_FROZEN)) {
+		pr_warn("Can't switch to [%s] from [%s] state\n",
+			luo_state_str[LIVEUPDATE_STATE_NORMAL],
+			LUO_STATE_STR);
+		up_write(&luo_state_rwsem);
+
+		return -EINVAL;
+	}
+
+	luo_do_cancel_calls();
+	luo_fdt_destroy();
+	luo_set_state(LIVEUPDATE_STATE_NORMAL);
+
+	up_write(&luo_state_rwsem);
+
 	return 0;
 }
 
+static int luo_kho_notifier(struct notifier_block *self,
+			    unsigned long cmd, void *v)
+{
+	int ret;
+
+	switch (cmd) {
+	case KEXEC_KHO_FINALIZE:
+		ret = __luo_prepare((struct kho_serialization *)v);
+		break;
+	case KEXEC_KHO_ABORT:
+		ret = __luo_cancel();
+		break;
+	default:
+		return NOTIFY_BAD;
+	}
+
+	return notifier_from_errno(ret);
+}
+
+static struct notifier_block luo_kho_notifier_nb = {
+	.notifier_call = luo_kho_notifier,
+};
+
+/**
+ * luo_prepare - Initiate the live update preparation phase.
+ *
+ * This function is called to begin the live update process. It attempts to
+ * transition the luo to the ``LIVEUPDATE_STATE_PREPARED`` state.
+ *
+ * If the calls complete successfully, the orchestrator state is set
+ * to ``LIVEUPDATE_STATE_PREPARED``. If any  call fails a
+ * ``LIVEUPDATE_CANCEL`` is sent to roll back any actions.
+ *
+ * @return 0 on success, ``-EAGAIN`` if the state change was cancelled by the
+ * user while waiting for the lock, ``-EINVAL`` if the orchestrator is not in
+ * the normal state, or a negative error code returned by the calls.
+ */
+int luo_prepare(void)
+{
+	return kho_finalize();
+}
+
 /**
  * luo_freeze() - Initiate the final freeze notification phase for live update.
  *
@@ -188,9 +351,23 @@ int luo_finish(void)
 	return 0;
 }
 
+/**
+ * luo_cancel - Cancel the ongoing live update from prepared or frozen states.
+ *
+ * This function is called to abort a live update that is currently in the
+ * ``LIVEUPDATE_STATE_PREPARED`` state.
+ *
+ * If the state is correct, it triggers the ``LIVEUPDATE_CANCEL`` notifier chain
+ * to allow subsystems to undo any actions performed during the prepare or
+ * freeze events. Finally, the orchestrator state is transitioned back to
+ * ``LIVEUPDATE_STATE_NORMAL``.
+ *
+ * @return 0 on success, or ``-EAGAIN`` if the state change was cancelled by the
+ * user while waiting for the lock.
+ */
 int luo_cancel(void)
 {
-	return 0;
+	return kho_abort();
 }
 
 void luo_state_read_enter(void)
@@ -205,7 +382,46 @@ void luo_state_read_exit(void)
 
 static int __init luo_startup(void)
 {
-	__luo_set_state(LIVEUPDATE_STATE_NORMAL);
+	phys_addr_t fdt_phys;
+	int ret;
+
+	if (!kho_is_enabled()) {
+		if (luo_enabled)
+			pr_warn("Disabling liveupdate because KHO is disabled\n");
+		luo_enabled = false;
+		return 0;
+	}
+
+	ret = register_kho_notifier(&luo_kho_notifier_nb);
+	if (ret) {
+		luo_enabled = false;
+		pr_warn("Failed to register with KHO [%d]\n", ret);
+	}
+
+	/*
+	 * Retrieve LUO subtree, and verify its format.  Panic in case of
+	 * exceptions, since machine devices and memory is in unpredictable
+	 * state.
+	 */
+	ret = kho_retrieve_subtree(LUO_KHO_ENTRY_NAME, &fdt_phys);
+	if (ret) {
+		if (ret != -ENOENT) {
+			panic("failed to retrieve FDT '%s' from KHO: %d\n",
+			      LUO_KHO_ENTRY_NAME, ret);
+		}
+		__luo_set_state(LIVEUPDATE_STATE_NORMAL);
+
+		return 0;
+	}
+
+	luo_fdt_in = __va(fdt_phys);
+	ret = fdt_node_check_compatible(luo_fdt_in, 0, LUO_COMPATIBLE);
+	if (ret) {
+		panic("FDT '%s' is incompatible with '%s' [%d]\n",
+		      LUO_KHO_ENTRY_NAME, LUO_COMPATIBLE, ret);
+	}
+
+	__luo_set_state(LIVEUPDATE_STATE_UPDATED);
 
 	return 0;
 }
-- 
2.49.0.1101.gccaa498523-goog

