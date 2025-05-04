Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98CB18DB18;
	Sun,  4 May 2025 05:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334834; cv=none; b=ue1duRjAp1Rc4TZglIXaLhIa4YNVNkZgh4xtIj/Ao/nC6TSG8yoDnZZsK2rzUTB/g91/O4x80jKPV7ouWaY3eKf+XMw5NgDhz5GzStg4tKsQIKQH5RbQpphsM6bPQVgWiB6SsGwSuYzwimpws+slEQey4mGHh97zJ8BwA66UDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334834; c=relaxed/simple;
	bh=BKYFylhCTXnSJ3PMuuaK85GfBtfvO9sTwbjzfzDc6KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2Mnd69DPokARNeyME0s+/i3aS15F7OlTaqnx0JeERLIiNy7GiF1WclYu4k7jYKu17N8lO7dxIz0QBqmhMqR/PB11EKB3xnvyt3/g0hDpSGp6pMzzEYspQNAsGGRQ3VUPL8p7wZ7fOMcGpisZcZXoCpjwiV53UlAz0urjrKij6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdrBK9q6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdrBK9q6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c3e7b390so3881866b3a.2;
        Sat, 03 May 2025 22:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746334832; x=1746939632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAtLYBrIM9/ajJYtasF5l8HBHfz0+HezoBSoeR9Mong=;
        b=XdrBK9q6VDwJBJAhkAfomiqV/NOQsFF3arnGSZU+3iuvHXdRijpO8+0RjuWNzALT6A
         eY31LsrDfhngA0dP6kYPbqSipRJZAUxHf6qAAKXfUHJqoLpoEv2MXK33ePzjG0Fatcd1
         2mD2DaAlY2MKyARQTpwltqi28HMkxYgXktIaAdP/HkZ+Iq3C1LvKipvEJSmcHXZ9hAJC
         LUfIdERg4uCpAIg2FEjYu0xHr+pgVsDuZhPgQeHXxahEmo6vwlqibIvDpK+5m7Si2XSl
         yaSoYPZo+Bk/PpOEbuebeALC3vzinWgjDDweFSXpVhbXL/PTK8qQLJgt8/Kj9PZMLFEc
         +Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334832; x=1746939632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAtLYBrIM9/ajJYtasF5l8HBHfz0+HezoBSoeR9Mong=;
        b=brZQIDC47beNaJ88eN9t2Cci+vqbY6T0QFjCfTsnCvCm77e7oGDAi4tu+065YjrPaW
         aEG+qfcIm1sjTGkcDsL3d3/Q/7j+n8sPefSz9CDzPVL4lyEXCFF6e4SduYlCXw25p4Sj
         CP+S++lsKtabh1M/nmYyoIp8+wQUUaYm8kVaCMeE7UVyxIm7M3MUCh1XsgmiTwii9HrK
         QDMkQrq5VWXeMSfhe6+69qf+MoGUMWwGz0Ry4rRdeHbnunoaepd9BjdPWGZwdlhH/mnI
         zh4im41N75SXrT+fMLzRq4odbyxaApzMKF8RRN5h9lqTETl7R3P/EQ5oOwJNsn6lGFj6
         pt2A==
X-Forwarded-Encrypted: i=1; AJvYcCXrN6FetYRWj/mp1V2q4n6ac7qr9Z/ATl9t9LFkxMLD40OHq7aFlqaC3QztWG0ihdwl+I08+QFlmfHC/SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEoHjgyJt14DODcsqEGJg1PZGuZpCveYPXK5HlStXOEm1nFPfF
	+sXdQi54LEK45YlCpHK/8GYiv/J51XVOopcmkVPi+kKWSSkRQKWKsFRIslFP
X-Gm-Gg: ASbGnctioz1IHiHKdWxRCXPotXXoL/suXDrDfM+TfcvM9w2BRKbCjf/yjaO1VFg7vMs
	WH8gAJ1mcK4p+izPgBBVRmh/YHwo3HCBIR4L1caEnfkxodWoFLhDFlhgMVfbXKE2qqZPfHJMPDw
	4DYKRLR0HmWrF1sTT8PXxfZfEPyBukgLQiEaa3aUg6h7Hp3RRAnkU1DxNFDirV1wZp211Ri99PQ
	AXoQb9SpE61TxaPk4hjMj640JRvLkGkPfnMk1pl4U/n5BYkVaI9hL05SFAc0/FxrdHncU6WQd4Z
	0He+FckBYjimr/8nQzyK6dbrfYO8D/qnTZW987BE0Fb62maB8qrluAsInoluL4NulMHXa6te0bT
	2N8nO7TQDoQ69xDN9nyptytqvyIK2
X-Google-Smtp-Source: AGHT+IFdxQJB/suLSC5KY0vhzDnmqJVYahHZj/LCDVtudCFG+nUAOQBEjr7DDKNM+n+NKmrbYxKhcQ==
X-Received: by 2002:a05:6a00:32cb:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-7406f0adf7cmr3670436b3a.6.1746334831893;
        Sat, 03 May 2025 22:00:31 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm4225756b3a.44.2025.05.03.22.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:00:31 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] rust: time: Remove Ktime in hrtimer
Date: Sun,  4 May 2025 13:59:58 +0900
Message-ID: <20250504045959.238068-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504045959.238068-1-fujita.tomonori@gmail.com>
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the use of `Ktime` from the hrtimer code, which was originally
introduced as a temporary workaround. The hrtimer has now been fully
converted to use the `Instant` and `Delta` types instead.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 3355ae6fe76d..e396c27e0e1a 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -72,22 +72,6 @@
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
-/// A Rust wrapper around a `ktime_t`.
-// NOTE: Ktime is going to be removed when hrtimer is converted to Instant/Delta.
-#[repr(transparent)]
-#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
-pub struct Ktime {
-    inner: bindings::ktime_t,
-}
-
-impl Ktime {
-    /// Returns the number of nanoseconds.
-    #[inline]
-    pub fn to_ns(self) -> i64 {
-        self.inner
-    }
-}
-
 /// A timer backed by a C `struct hrtimer`.
 ///
 /// # Invariants
-- 
2.43.0

