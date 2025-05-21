Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B213D8A0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839897; cv=none; b=l3MLAYguDFbbpf0RphDtMGflVdPwMSA5ZpqxGMdjUo29MKnPlZQ541xbkCrEBeEJsXyPz1PI+wM9dj9EVU7RBJtdBgX8a/AYYn525g4ehuo60XTGXPZ9buGzEnEsnVMbOoGqaSAO5gS9gxlI2VRyMQWdn59TemHhDlHUFIvA7PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839897; c=relaxed/simple;
	bh=H9Ob5n9wa5J+FXlx/0WvGSCNT12tZXNb1lB59H/PKlc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NB5JuPlXMi/OD7JoCiScUF0eXD9P40xa36vy7MTw5YhB6yTXWl6X9XFC2mJLEikoKCcyjvmMYIxcU151laBmDPNXADLhvwtarwsEYF5RSySIZEfv3ZQ92ReQfaoywTEVT0MhzYhIu+NRvqn6ncwnHA+fWRvafbSDr4HuqJV8jOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oxRYK6mw; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oxRYK6mw"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a3660a9096so1939632f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747839894; x=1748444694; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdExpXOBdyQxHRSYTke1g1qR7XOSapka6sbXRQuHZII=;
        b=oxRYK6mwGbIq88NlmkefTPjH4SR0veeZDaMBNSErTRt0NQ0ZNJGM244s2pqGqYFG48
         cE/F3nBs/hqYyFNUwM886qYmKawtx4hPoZqiG9YvxQ02JA8rbfXS9q0+4oLLDgwc/DEh
         lU2tEQf2cYd4nub9BfmyV0zDLn9w/rdncPSBfTFIm+hxlj/larXsmuOqhAp6p7EroNvE
         gi4jcVA6pu5v1VPQ6nxe1Qbjp1rhBZMZso/9AUM3VyJPvkdmo7h5vM/PBaYyKlChubSm
         lt8U115911QLGMq9T8ykN5xTrQTzoT3jA3RpmQxsnx5whMmqlqX4prdk4WbZtN/sNcXX
         TzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839894; x=1748444694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdExpXOBdyQxHRSYTke1g1qR7XOSapka6sbXRQuHZII=;
        b=BQC7Nwc5gQCMLfAXtUXhzn02Rk2U9qo25Tmx82nfxFBC8d4HleMf+WGg9/cyJVTWeB
         sFGceYEx0V9kdoPH2gtCTOpPETBvrG0Q6NuUkhgxWe5H7F+6fHFbxsyhF5pkEnsyuXHj
         h5J8Qk4FM+e6q5GbaNV8OSw36dlyr0FcjEbP9ACNkAYjWJ9TgPZd/ZNSboqpGWzcUm4d
         4B6wtrAbr1kmTpZVsNs4j8llBTADcDxlE3Z5N2hNZyEsolR5JfOLN1QLIiFtgjdzgDcN
         mmZeHVpEojIIc3VsCwYTdyaA0/SGXuxeGSH19daNCl0yg6e4eufuvYDOck1aJbSxgkGT
         upPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+KjUX/AKhPVtoma20K2KDg9xCjuMlw46q9NQrbyxUTbWTVou8EW7Chc+gKlcbZvX1NI6QP9VmI5eheEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzwdPiswbUH+KGUfxSsoHw7nAXjUtczP8GA1jAj/PoEF+xQGX
	pB5DHDGzYQF4r5S0k58AaBqOty45b5XyLQUNWOrS/AVkrhQNqFRI3gHkmdlBvzXnE83PnSciCX6
	2V8Q+nISHLQ==
X-Google-Smtp-Source: AGHT+IG5iq1L7A5fViI6aeJ06pNTiiwfp+a9KlNvOLCOF5r39BCHJQThJWh3w3IPT/NsLc3iqwvLiqg0SXNM
X-Received: from wrs19.prod.google.com ([2002:a05:6000:653:b0:3a3:678b:a096])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1445:b0:3a3:7be3:cb81
 with SMTP id ffacd0b85a97d-3a37be3cde9mr5536563f8f.39.1747839893966; Wed, 21
 May 2025 08:04:53 -0700 (PDT)
Date: Wed, 21 May 2025 17:04:28 +0200
In-Reply-To: <cover.1747839857.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747839857.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <af6a04dbfef9af8570f5bab43e3ef1416b62699a.1747839857.git.dvyukov@google.com>
Subject: [PATCH v3 1/3] selftests: Fix errno checking in syscall_user_dispatch test
From: Dmitry Vyukov <dvyukov@google.com>
To: krisman@collabora.com, tglx@linutronix.de, luto@kernel.org, 
	peterz@infradead.org, keescook@chromium.org, gregory.price@memverge.com
Cc: Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Successful syscalls don't change errno, so checking errno is wrong
to ensure that a syscall has failed. For example for the following
sequence:

	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x0, 0xff, 0);
	EXPECT_EQ(EINVAL, errno);
	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x0, 0x0, &sel);
	EXPECT_EQ(EINVAL, errno);

only the first syscall may fail and set errno, but the second may succeed
and keep errno intact, and the check will falsely pass.
Or if errno happened to be EINVAL before, even the first check may falsely
pass.

Also use EXPECT/ASSERT consistently. Currently there is an inconsistent mix
without obvious reasons for usage of one or another.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Fixes: 179ef035992e ("selftests: Add kselftest for syscall user dispatch")
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Gregory Price <gregory.price@memverge.com>
Cc: Marco Elver <elver@google.com>
Cc: linux-kernel@vger.kernel.org

---

Changes in v3:
 - Added Fixes tag
 - Moved this patch as the first in the series
 - Added prctl_valid/invalid helpers
---
 .../syscall_user_dispatch/sud_test.c          | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index d975a67673299..48cf01aeec3e7 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -79,6 +79,21 @@ TEST_SIGNAL(dispatch_trigger_sigsys, SIGSYS)
 	}
 }
 
+static void prctl_valid(struct __test_metadata *_metadata,
+			unsigned long op, unsigned long off,
+			unsigned long size, void *sel)
+{
+	EXPECT_EQ(0, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, off, size, sel));
+}
+
+static void prctl_invalid(struct __test_metadata *_metadata,
+			  unsigned long op, unsigned long off,
+			  unsigned long size, void *sel, int err)
+{
+	EXPECT_EQ(-1, prctl(PR_SET_SYSCALL_USER_DISPATCH, op, off, size, sel));
+	EXPECT_EQ(err, errno);
+}
+
 TEST(bad_prctl_param)
 {
 	char sel = SYSCALL_DISPATCH_FILTER_ALLOW;
@@ -86,57 +101,42 @@ TEST(bad_prctl_param)
 
 	/* Invalid op */
 	op = -1;
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0, 0, &sel);
-	ASSERT_EQ(EINVAL, errno);
+	prctl_invalid(_metadata, op, 0, 0, &sel, EINVAL);
 
 	/* PR_SYS_DISPATCH_OFF */
 	op = PR_SYS_DISPATCH_OFF;
 
 	/* offset != 0 */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x1, 0x0, 0);
-	EXPECT_EQ(EINVAL, errno);
+	prctl_invalid(_metadata, op, 0x1, 0x0, 0, EINVAL);
 
 	/* len != 0 */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x0, 0xff, 0);
-	EXPECT_EQ(EINVAL, errno);
+	prctl_invalid(_metadata, op, 0x0, 0xff, 0, EINVAL);
 
 	/* sel != NULL */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x0, 0x0, &sel);
-	EXPECT_EQ(EINVAL, errno);
+	prctl_invalid(_metadata, op, 0x0, 0x0, &sel, EINVAL);
 
 	/* Valid parameter */
-	errno = 0;
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x0, 0x0, 0x0);
-	EXPECT_EQ(0, errno);
+	prctl_valid(_metadata, op, 0x0, 0x0, 0x0);
 
 	/* PR_SYS_DISPATCH_ON */
 	op = PR_SYS_DISPATCH_ON;
 
 	/* Dispatcher region is bad (offset > 0 && len == 0) */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x1, 0x0, &sel);
-	EXPECT_EQ(EINVAL, errno);
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, -1L, 0x0, &sel);
-	EXPECT_EQ(EINVAL, errno);
+	prctl_invalid(_metadata, op, 0x1, 0x0, &sel, EINVAL);
+	prctl_invalid(_metadata, op, -1L, 0x0, &sel, EINVAL);
 
 	/* Invalid selector */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, op, 0x0, 0x1, (void *) -1);
-	ASSERT_EQ(EFAULT, errno);
+	prctl_invalid(_metadata, op, 0x0, 0x1, (void *) -1, EFAULT);
 
 	/*
 	 * Dispatcher range overflows unsigned long
 	 */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, 1, -1L, &sel);
-	ASSERT_EQ(EINVAL, errno) {
-		TH_LOG("Should reject bad syscall range");
-	}
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_ON, 1, -1L, &sel, EINVAL);
 
 	/*
 	 * Allowed range overflows usigned long
 	 */
-	prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_ON, -1L, 0x1, &sel);
-	ASSERT_EQ(EINVAL, errno) {
-		TH_LOG("Should reject bad syscall range");
-	}
+	prctl_invalid(_metadata, PR_SYS_DISPATCH_ON, -1L, 0x1, &sel, EINVAL);
 }
 
 /*
-- 
2.49.0.1143.g0be31eac6b-goog

