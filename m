Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC320D516;
	Mon,  5 May 2025 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443424; cv=none; b=s+U6mFzi6/I/IpJz1CmABEc/e5MENfOI2F8flVcrqQq7ZRAm/gV517uVJafBy6H5J/yv2vuYXsmzfVkN3EEPqBPKFcaPNiAEcGX0gDzl5pP0MrBYJW6OAR9Uw8BNqpFioXd6JzoZmB/mKGv5vQT5UXzxKAaOCRImVtfQ+PSHkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443424; c=relaxed/simple;
	bh=4FpffMYXeHEJ5GO+8GXJNipXl6pN/tMkkzwOR8vDn4c=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CK4K1UowG0QZLune9Fc7p/BKj56hf38QLAURSN4Ctry6ihw3HTqDATgB1BfnkmUIqKGyi56P16k4G8mcrZ7uVfymAwq459r0mtX7XaPD9XmZ7oc+q3/COd2IO8RDWxI7wiaHqgCMnnE0H/vi1TqkOpPu1g1wv2KU3lNgBelx84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxru4Or9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxru4Or9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-309fac646adso4752925a91.1;
        Mon, 05 May 2025 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746443422; x=1747048222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWZuGmIjp3ybCCUuK9xfd6vrGm/T4V2mNK0626+PnFI=;
        b=Bxru4Or9bYvAzfaV7UKPDjf0TpMcwlzTS3aopnsZdT8IueO8eWsGUIgOMXFz/1ZmL2
         iR++aBQGEnbAm6z3CYMlcNll/4YKnu0woAG8ezFcJ2ZgvwPdwNEQXtACIQV467NAvuU1
         ea0cAr+L6y8HUuMa/0FL1nzq2dIKOaJoIg1PlRrdEcv0trm/bMIjBhEMDYELor7QeyKW
         15a8B1eUt+oAHUjbi7ohmLtbDyX6KnrCsTXRgWth39nuCQ9yeK5iYBHWge3rz8Iha89k
         5DuXwAcIOOSjKHKEd3Y0SKWG+7tN9hi5k0YlvlAGxxINXufvGbhj4f0sVvB3ic0LImRL
         VNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443422; x=1747048222;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EWZuGmIjp3ybCCUuK9xfd6vrGm/T4V2mNK0626+PnFI=;
        b=KnOw0egroa9FWY6FMEI4+o5ew/J/25Y5c9aAO//4F9o2HGJ6kzYkpmihMujbfYSHZ/
         WuWAiLu5xilmlwe8uubxROMRknuPBnBYsEaS+aTX8fnYHjXlnSFp804z5PQAQjCWi6I9
         DpCPNP1i5o4jsNzzLn1FAp/Eths8UZrfvQwfbu1FtnlwOnC8sB4uezPj8cgM1k/6pQAy
         LgXMespYv0tLov8oUCmqP+vKfX0VDUlWk/5mmXRbPagqYZeqy6zwOJqJTgiQfR+RYGxv
         I9tGB3+JvfBz+Oz7/KvukoyrDuPHxRNMu5/q7MNNRL4xoAp2nCQXVp9TIMRzKWX9tBao
         Mqyg==
X-Forwarded-Encrypted: i=1; AJvYcCVm6M0GBFM2QFDEoIgyEFNaQOmblFZYEKI3l3rAbcZLj2H2aZhNv1tsc59+Ybm9OvDwqAmOiEgpWdEOSUY=@vger.kernel.org, AJvYcCWpgQdd5Z3lEC+j6Zl3JdIA4kYAIglatfsNt5U/d4SVhb1VQYdgWmLK39SQ/ipuaX3Ez3F7zT5x46ZIRGq5+/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3M9KPTajvlOtne+fhaaWXwMAOOVroC9Ebox64bGHBepolF9o4
	/myw5zawE2AkapGisqsQwfaE+4OCDdUTHe2pNlQW1LuRaDKGB+hV
X-Gm-Gg: ASbGncveeSY8mCrxPT6ot7GeyI1P+1Px9oRvsoAhTgwLKLJGoeIMke/31BNkD1ixI/Q
	iDReiyV8mzLctA524sI5H4CJamhZ6dTzcdI4NDzfdNbhxX3Bhz+u4xN0IBQ1rvjRA71sLz09f91
	kVJbP4HOqG06NovhzsXtAvxiYZIEEvErNa4xa04uTOtG2YaE4O6DkzWMfthj/l014put9YO/hJs
	/UI93gcx+iF9qg4XjaPuna8PXhqjFGDVd+jT1UEYvIt4U3HCvjKttdnkeB6DfHTRSg+6PiNwPrj
	uYEigG1z9npAVyfP5ngDtNGb+CMXmzvjHfVMmgOGJJkkw/3C/6XB8L8DyRoDA0lKbktyquIs3h1
	Tef2zXaf9eK53ravEm1JYnAc=
X-Google-Smtp-Source: AGHT+IEZmSfLIk3S+fUHKlWusHm69xBh3+6MJHfHPMfo8DaMWKxk52G2ayt5nH2JD5u2ecF39C3Jcg==
X-Received: by 2002:a17:90b:4c51:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-30a4e1c94c3mr17244354a91.3.1746443422415;
        Mon, 05 May 2025 04:10:22 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb4asm51617915ad.113.2025.05.05.04.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:10:22 -0700 (PDT)
Date: Mon, 05 May 2025 20:10:04 +0900 (JST)
Message-Id: <20250505.201004.457132112950898883.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.hindborg@samsung.com,
 boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
 arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <8734djxrm0.fsf@kernel.org>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
	<8734djxrm0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 05 May 2025 12:46:15 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> 
>> Avoid 64-bit integer division that 32-bit architectures don't
>> implement generally. This uses ktime_to_ms() and ktime_to_us()
>> instead.
>>
>> The timer abstraction needs i64 / u32 division so C's div_s64() can be
>> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
>> for this timer abstraction problem. On some architectures, there is
>> room to optimize the implementation of them, but such optimization can
>> be done if and when it becomes necessary.
>>
>> One downside of calling the C's functions is that the as_micros/millis
>> methods can no longer be const fn. We stick with the simpler approach
>> unless there's a compelling need for a const fn.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> 
> Please consult recent MAINTAINERS file when you send patches. If you
> intend for me to see a patch, please use my registered email address.

Sorry, I did follow that for the last two patchsets (generalizing
Instant and hrtimer), but somehow I messed up with this one.

Should I resend v2 of this fix to the correct email address?

https://lore.kernel.org/lkml/20250502004524.230553-1-fujita.tomonori@gmail.com/
