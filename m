Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD528D8D6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134935; cv=none; b=mCmzrPk+VdKR/bgk3EE3HODyDYUk2b1Y2b431Usj5XdwhZzpbwurkQaPCf62g/aeqA/nqUkUKRrWN5yU6/u4gwEDFlhTlzEPY7Hq6kZCA1GmNcEDp1OtKDLrUt0PHP/jSWnjVSh+mgv9/xCSkvUp34RRf1oxJMlCMLFu1UJfZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134935; c=relaxed/simple;
	bh=AhF8bIdnTy+Y/qxrf9w8y8UJ6QfJLOXbePlpFq4yrMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9Vt6kUG/DrH3ipbNpg5NgFg7NoDlmZxW3w4CBbgydAN5BkGeEseDDZ9i+JxJyVNNjPc0BP3toeHvCpJwIKNZ12j0BBDsiOWhvJAzdD8RY+OIS5tRixOrcUO5J9F/lJ5d+iLmYDLZN/Z2HZGUbrV/SaKdniyk0wX3sZskMp6anA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlj81oyJ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlj81oyJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fcaff7274bso6915337a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747134932; x=1747739732; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhF8bIdnTy+Y/qxrf9w8y8UJ6QfJLOXbePlpFq4yrMI=;
        b=mlj81oyJoJ64ktqmeZOytjre33jrHXdGJmYvnda9+Wmj/Zpmlk05crvmS8y3EC8oVY
         /qzcS+cx8H2VTTuuwYu2legqJedbrvycN7e81f5uAU/cYfcQRBQ7Qk5bnoj8jOns/omn
         TixGPUgcCoAFoDm4ghAt8z90E/g7dB8Leycs/c0VEaIlqRk9lncegIe+vs7ZuCn+VTgL
         /qjENpd3vQtaLL12Ju3V5V6QbxAy4TH8qVaSFYF2RXD7vULXQH+0wLDY9dn0DHvITvwD
         HLNn+Rzq+qLgOjThI24sSP/5IwV/0zD9K4VyxWgVCDQStoPt9PkDSZzLBQhxzEEs8wtB
         GqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134932; x=1747739732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhF8bIdnTy+Y/qxrf9w8y8UJ6QfJLOXbePlpFq4yrMI=;
        b=kwRwlChWFWYCY4nr7uXyihC/wZwlANJbA1G7NW+uXs3rQmXTzw5noSkyFwA26QSuYL
         Vxd+UzdP+cxtDuhZcH4PDEwEweRs6QTGmRkgfOZnHPQIv08mWuj88WjaNPCokzJlyrYL
         8RngpnHEiTEeRltSdsLosbTwLOpKM0jJO3AjWsrQpctVpLs5c+wInr0vnHRlcbLk07Eu
         Hj2mEDJie/zSHqen9sAs7lKObuSwS7LGk2+La25j6ZU+/ILI0CdMB84Xhrrg3mKLmk6g
         R7PRGM+GtIY7Bw/zZjKxp6qEleu6cpzreLpESFKw9m5TVSbk0Bz+UbpkFJpT8p3dJALx
         et4A==
X-Forwarded-Encrypted: i=1; AJvYcCV0fk38/0PmGKCFnAq2o+VseowZdCCFloxZMK+P3vXkt9OsH3dLiWUeN7EbE56JgPGcNMEl/CNv7cabNIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9IKUGFVy+HEB3grSoiShfS1f4Fl8gdkqZ88Ej2o55Mpj4mrhU
	NNGoZf6Gn462o+Mbwv9tt0/BKZQrlhy6DkWK6MvJmuY+eoanIoYC2W+PSXbguq5kFSurPOMuDpX
	1IUpVRmdnc5OQw9AKzlN5iUc/vCJqW88Gs5tC/A==
X-Gm-Gg: ASbGncvDeNTl7BOGYLJMWjxirQKuN3s5wED/1zZ0kV3ABkfJPuowVOgjnqxrSOnT5km
	3oioESCjjCrF1WzYdeJlJHKF3lcSyxFD+V7FLcIksShBaMN2R3EGhh5LwlUpFeely/YwHEbhOG5
	DpoU9z5NAiPMn2z3S7twvX2d7fv7zFIpU=
X-Google-Smtp-Source: AGHT+IGXf+iDKLrrQHjlB4FGrZFbBhRWOjCFwyUy3x8K2OYM0ZMXpOMeBMC/MhaRMSqpdupGiUbH5DeaQQlfucFHbjA=
X-Received: by 2002:a05:6402:354a:b0:5e5:bb58:d6bd with SMTP id
 4fb4d7f45d1cf-5fca0759a40mr14459799a12.10.1747134932219; Tue, 13 May 2025
 04:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7> <20250506101311.142475-1-andrewjballance@gmail.com>
 <CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com>
 <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com> <CANiq72mSDEwDQx6ePq20SRi40aCs95mwo6fShZ0WCK9rmiWVVQ@mail.gmail.com>
In-Reply-To: <CANiq72mSDEwDQx6ePq20SRi40aCs95mwo6fShZ0WCK9rmiWVVQ@mail.gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 13 May 2025 12:15:20 +0100
X-Gm-Features: AX0GCFt2EYzacWRAlkaHJqajAcqqOrheeZjX9e1wO3lRfd_bCajvJq8aw75ONa8
Message-ID: <CAKohponPm5z0Rdy7FkYoo+YfhfQtfUUE65Oq9kYVNaCLRVPNUg@mail.gmail.com>
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq, OPP
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Philip Li <philip.li@intel.com>, kbuild test robot <lkp@intel.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org, alex.bennee@linaro.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, anisse@astier.eu, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	bqe@google.com, dakr@kernel.org, dakr@redhat.com, 
	daniel.almeida@collabora.com, gary@garyguo.net, joakim.bech@linaro.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux@armlinux.org.uk, linux@rasmusvillemoes.dk, 
	manos.pitsidianakis@linaro.org, mturquette@baylibre.com, nm@ti.com, 
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, vincent.guittot@linaro.org, vireshk@kernel.org, 
	yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 09:43, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> I can still reproduce it on next-20250508 with defconfig RUST=y
> KUNIT=y RUST_KERNEL_DOCTESTS=y and then running in QEMU with e.g.
> `-machine virt -cpu cortex-a53`.

Here is the full log from my side: https://pastebin.com/u7UK58rQ). It
doesn't report
any failures.

Also here is the code we are talking about:

/// let mut mask = CpumaskVar::new_zero(GFP_KERNEL).unwrap();
///
/// assert!(mask.empty());
/// mask.set(2);
/// assert!(mask.test(2));
/// mask.set(3);
/// assert!(mask.test(3));
/// assert_eq!(mask.weight(), 2);

I don't understand how this test can fail at your end after the
first three `assert!()` have passed.

--
Viresh
