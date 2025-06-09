Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FA24C09E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467942; cv=none; b=I1ObFNhwp6rZIOlw5u2UbjGpVBRpLWtBG/LnbamCK1G5uxV6LBk0mI4a8gh8UTY9/urYbeB4rNWtBTv4htDlMBTyPdL7vSMr0QDYG1s3WNbPVEyy0CCvbC/6vgdi22OnvY8fPLsGbBUIOoGkiFprR20yOfflWgODvO+uhEot4RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467942; c=relaxed/simple;
	bh=7dJNhIAlm6Mfp4Lc5SIAFLEuSWj3N1nwqD7MqG6nlVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usicYIMAzmBn1GHH9nFkBXqNLyKD7r5fP/4KB638WvzTQGoWq9gEQwKpGqVo2STU0p/gRu+Y8Ms8R/QJgsWmc22tgL+CsBni4001/05zO5FohQez9Wev443jbf3MGlDyKsK2LAgPha6pgabx+L6FNbJtzu0qbamvt5h//cuDKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYVgTyLk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYVgTyLk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4720011b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749467940; x=1750072740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJTBDYi3mfhW0vSHbVTVLXWBoTdoqifrr26dHjhiXOY=;
        b=cYVgTyLkAWRFeEv8oS0hly4+o3FYqaf3atkTQSJVuoLGU5D/pCFrwpC1rHakhnj7He
         y3N1hbU+f2bYWsLZdFdm1f7+Gw3WpRYDpc2g/rnu4q13W0IPkUCMNqTjWIeFPd6jlw6l
         ztrzh7guz1XuBnZSxhJOY+KZnj02Tc0p6HFHgb2daqXhVpgmKQB7MgII4sp/9lKaapsS
         uz0Ny9dAWRXYx7sS6TZ8szojUfxi/Upmd4I6/tc7WR8h/9Hf0mQWxGXn2mzxgGczxfSn
         UkPqXXNgzUkCgWabq+yXBOIeq80v69ccInLyvP9l+CA26CR48bY6ZSX/WSVU33mz9nkC
         4Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467940; x=1750072740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJTBDYi3mfhW0vSHbVTVLXWBoTdoqifrr26dHjhiXOY=;
        b=VxncQIZ2FWoY6IMhgphPbLWpaSMHQat5ySloqRpHIzsp6Uc+qqvR8W664gKrLBWPbY
         r1Y1xN4hOauSXOEc37sonBCmFDOHjnmimoGjlp5pIeHN28bJjEkGvP9xV/fnh4xmqa75
         mQd/2IzfEXylxN8itlDR7LeZJEieS2n4TLuKJNJ+p+46zb3gIytAMwt3MjVVxqgA+Wcl
         hXGpeftp4ILpO8lkX3CsEaj2x/oUGQbGYnUm4kNkrcBz7RjUsdQp4DrTIKUryoGLKY+a
         jEyDIxjPgM5FgJ1L+4KxWwwiO9Nsyq5kzecbVM8HG/O8cycYEHyiF75NIEtcGMtppLcl
         m2PA==
X-Forwarded-Encrypted: i=1; AJvYcCUPT/FyfpidKlWKuHPuIe3NGTbic5K+jZ70iVPPjAyuF8MRQawhsiKMOOcBW5sedWDnUuFubFQnM583Gfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU21Q8znnlL+lBllmXBEWwrOPAnrzhVyN5mkk+n15ljnqvJCyQ
	EnDBZGxRTCoQjnIVoVYCCbtVtiyuUM6C5+2Ppo1dMOmBGwHVTBWpKotAoXaLgSm1vFY=
X-Gm-Gg: ASbGncstZ6sxP88ZtTUTnEKQrMl3N0A0pip+Tc7kU+lFEv8D997K/v531DDQUcBCbE+
	fVm46KsTC5fbViAxfx2c+FpBmVc0OffEDY+2VkdO6Nw6a2zVLgmLl/kl8y/AescQjFqkiEDLnD7
	RXaoxugTqpWq068RvxEgn7w1uJdzpWjv/T7yKxrV0ex6F2/kD8Xbz24SdjHqJFwc/NLxb34VrYG
	J3mOg1yQgg5itoP24Jv8KHrqLycOyD3Vru8GzyiluQauafR51Jlgqx8u63XLwFfitA0FA22IrLk
	wMfiYuTYJyOSHlw/gF6I1IMsHd/sMSBmBva19HUUjyrnO+E5zW5l
X-Google-Smtp-Source: AGHT+IFhybAqxujM1b9MvWlhlvkWqi5+9H9O5A+kb+hxy81eoKki3xjJHw6zvFwLj8OPRGAC3kwPHQ==
X-Received: by 2002:a05:6a21:6da8:b0:209:251d:47d2 with SMTP id adf61e73a8af0-21ee689ffd5mr15835949637.11.1749467940462;
        Mon, 09 Jun 2025 04:19:00 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f66a96csm5105536a12.47.2025.06.09.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:18:59 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:48:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250609111857.ijvagblorxtq7d2n@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>

On 09-06-25, 16:21, Viresh Kumar wrote:
> This adds abstraction for representing a CPU identifier.
> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  rust/kernel/cpu.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

Boqun,

Should I implement CpuId::current() like this ? Will fold this into
1/2, if it looks okay.

diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
new file mode 100644
index 000000000000..61d0387c8cf3
--- /dev/null
+++ b/rust/helpers/cpu.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/smp.h>
+
+unsigned int rust_helper_smp_processor_id(void)
+{
+       return smp_processor_id();
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..16fa9bca5949 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -13,6 +13,7 @@
 #include "build_assert.c"
 #include "build_bug.c"
 #include "clk.c"
+#include "cpu.c"
 #include "cpufreq.c"
 #include "cpumask.c"
 #include "cred.c"
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index da53f04da495..b093d22ccbd9 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -94,6 +94,12 @@ pub fn from_u32(id: u32) -> Option<Self> {
     pub fn as_u32(&self) -> u32 {
         self.0
     }
+
+    /// Returns the ID of the CPU this code is currently running on.
+    pub fn current() -> Self {
+        // SAFETY: smp_processor_id() always return valid cpu id.
+        unsafe { Self::from_u32_unchecked(bindings::smp_processor_id()) }
+    }
 }

 impl From<CpuId> for u32 {

-- 
viresh
