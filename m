Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C028E17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749163574; cv=none; b=edx5THy0jl9uIycRw5jhZ9Tf+zAIVdi44baAEA0x7rkBqmbXcgzvaCySEFqaur3EON9zRxpgguhh+Zqn6C21QqgpCvgdI9UqtMXLqjAmNXsP6wQjgIIfktmuwVmZEyjUfgm9Vdoi0SDSrUd4SETjipKCEoJRyo7NXPcC1bRzTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749163574; c=relaxed/simple;
	bh=dsSqUNKmgh/6WThv0i/ykSnRIsx31uBh5hec6PX707Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NwC26+h5NDIZxlK8F77gkuccWXdc/FdQzcFXAMQiDP+zUXCyzs/4Um1K1aK9LPJXMrIG/nVj2BTcrLeCOVK07D4h8lMPDV+cRFSd54gcftGx1raGlqcDV+k2Xaqm2wnGya69V3iKWnQeybPgiEw4+cqSJNrXAtlkIAFgmEQvbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0wLYSXs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0wLYSXs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d6ade159so13193935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 15:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749163567; x=1749768367; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/j39Ggz2O70zHWRgH0O3F7CeX1QTx+CC8wYROpgb8Pc=;
        b=m0wLYSXsZGotNFIU7WL0PjzQZ/bf0QQmu5Vg6/Ckk8dPZLcGtHt6ATM1nGBtl4VkpD
         8WjsMY//lxqnWu8UOSmKag6ReT5pFUD2UYyFM2hbLl4m6XOYIWbdeOoRYLJW2dJLQ9l3
         Lf56KWIhFAX7ZvPMFdqq5cHqhxybolF5VV5uTmwSxe7iihI2Woh3/Dmv9Vl+cq8claQ7
         IU1VM7wvsD1olZ8Ec/pTQu755QUiyE9wK3OcAYGR3H9oVh3ngE6MZyiiyuhC7tBwtsZV
         iuqcSyDbidGWgtTEKWKRz8OB3KPT2HWYq/62kgtAJ1Fzm+sScJ3gQyRP4TZC2/Uv7SZe
         jyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749163567; x=1749768367;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/j39Ggz2O70zHWRgH0O3F7CeX1QTx+CC8wYROpgb8Pc=;
        b=Omrtd4XEYK6S9UWO01bzr2OSbiJhMABXK6AagYbrA3VE6v6rVFde1WP+M5hpXArDMX
         +2iSrdLQPekDtR/zT5bOR0vGXb49kCzb4zjfdKcAtjyWgb7MNUqOcbbMrMHAQS11rku9
         oK67WHfWdKvOuRcFia+RBdCDJi5cj6zJVr8YAmukrX1CMrxMZQeQpDVz1o6MLXmUedHI
         bbmDvb4QtC6+YLEgcAck+xk2F0kGwkSmkcCPY0eJ7hESJFZXiJs0mjgZnVNDgHv8A9ba
         jYXVoRarWoxmPX2WMkrQb7o2wRh4g2OFrT2fmIHu70cNlguot61x1EnrI7+ckPZjbKyp
         8dWQ==
X-Gm-Message-State: AOJu0YxBZp/hXoLVkIU3kNnZfYXAQgWrwxhQMKrdxR71sUfS1+XtGaD+
	ud6IC7CdTF/pxI8feZ4IY9WHH4whMrnaaC86IO7s+jbj2XXDH5bc9JTs
X-Gm-Gg: ASbGncuix6bcIzqUjh9qp5NoW1P/tjjRA6h3rgBB6X3NMVWxNvXS9vcLJrCdWQjWlt+
	O1LExvu0xoDLl7AmBtyLMiWzeWfXDugr4DQJo4soXeHQsgayJJyCRcdB6Ev6daS8Gr5QvrO5sI9
	qSoEBhCtdA2yFkQ8R5cbaNVIVlvgFcqy90r0P6JnOz4H2huYI+fF952Bsur11lHejjjad6YvsA7
	mxatVyzs96Mfbcpw4KIgWJq/nN7wExWm9PpL6pjhC8dVIwjW2L8z6Vpt7t6tbNFl+o8m2J7SuEg
	TiP1dkf86eZsCVsIPLr/j0hPRGIX2In9Ox7Mu+dq6d2ept1X7iI5UYBRV7Hz7GeTUf7uA5ZsYzY
	EXYGgzQ==
X-Google-Smtp-Source: AGHT+IGKrymZnXxOkye1Q3PwtzYrH8EBx7NwHPPPJQuLYaUiZ1WKqbSqFUXXOlkZcSHaMHmFoIbU4A==
X-Received: by 2002:a05:600c:1c1b:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4520139c741mr12559335e9.13.1749163566815;
        Thu, 05 Jun 2025 15:46:06 -0700 (PDT)
Received: from smtpclient.apple ([5.29.20.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8ef98b1sm29001505e9.1.2025.06.05.15.46.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jun 2025 15:46:06 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [RFC PATCH v3 5/7] x86/mm: Introduce Remote Action Request
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <2666b165d262a3bad73a3a4d886fa6d16bced03c.camel@surriel.com>
Date: Fri, 6 Jun 2025 01:45:54 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org,
 peterz@infradead.org,
 Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <51570690-D1B2-48EE-96EE-5C90B93C7067@gmail.com>
References: <20250605163544.3852565-1-riel@surriel.com>
 <20250605163544.3852565-6-riel@surriel.com>
 <9290E368-A0E1-4429-B14C-9AEF8DC71672@gmail.com>
 <2666b165d262a3bad73a3a4d886fa6d16bced03c.camel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> On 5 Jun 2025, at 22:40, Rik van Riel <riel@surriel.com> wrote:
>=20
> On Thu, 2025-06-05 at 21:54 +0300, Nadav Amit wrote:
>> Just few small things that jump out=E2=80=A6
>>=20
>>> On 5 Jun 2025, at 19:35, Rik van Riel <riel@surriel.com> wrote:
>>>=20
>>>=20
>>> On 5 Jun 2025, at 19:35, Rik van Riel <riel@surriel.com> wrote:
>>>=20
>>> +void rar_cpu_init(void)
>>> +{
>>> +	u64 r;
>>> +	u8 *bitmap;
>>> +	int max_payloads;
>>> +	int this_cpu =3D smp_processor_id();
>>> +
>>> +	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
>>> +
>>> +	/* The MSR contains N defining the max [0-N] rar payload
>>> slots. */
>>> +	rdmsrl(MSR_IA32_RAR_INFO, r);
>>> +	max_payloads =3D (r >> 32) + 1;
>>> +
>>> +	/* If this CPU supports less than RAR_MAX_PAYLOADS, lower
>>> our limit. */
>>> +	if (max_payloads < rar_max_payloads)
>>> +		rar_max_payloads =3D max_payloads;
>>=20
>> Unless I am missing something, this looks very racy.
>>=20
> All the CPUs in the system should support the same
> number rar_max_payloads, since they share the same
> rar_action table.
>=20

Usually you don=E2=80=99t want even benign data-races because it might =
cause
tools to shout for no reason. So you would want to assist both other
people and tools such as KCSAN by marking such accesses with
data_race().

However, I think perhaps the bigger issue is that you want to assume
all cores have the same RAR settings, and right now it might be a bit
inconsistent.

So you may want to do some initial checks on the BSP as for
whether RAR is supported and what rar_max_payloads is (e.g., in
bsp_init_intel() ). And then on each AP, in something like=20
init_intel() you=E2=80=99d call setup_clear_cpu_cap() to disable RAR if =
any
CPU's max_payloads is different than the BSP.

[ BTW: further regarding patch 4, it seems cleaner to call
  rar_cpu_init() from Intel specific code like init_intel() ? ]

Just sharing my thoughts (and further clarifying them),
Nadav=
