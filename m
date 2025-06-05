Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460FB19F115
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149673; cv=none; b=M/k6+QgblCQATMRlRUlItLcnF2WqcLL4NjhNqlHyAK/2DdKChDWP8UYIGV5YAPOvyq1q3Mzm66VuS5FGyklJQ25FWZrnHI62LsMZia0qoJ+m4di9MQlG1d8vDNtn51IRMyeKttND6z+M1hkibopBcLTHhrDIt/gAhllhAy3pDxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149673; c=relaxed/simple;
	bh=Kb2/NOQBMqY1iKZZE93R7cjGWMGLGvypqN5bTBgvyMw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HJT2U2FjKA5LzABywk4NgFBhFc23PAfgHg8ViktXrXB/XjDxRYXlvDssCI037GyPtGSk/GDne0FIuF/DZ/yMEC//RaQ9yEayYFphk7am3vGbHRyF/zJqxU2irEZg5Jk0LYv69UrUppOnRIikQ2FNDTjgF3VolDScBxB0bOcANQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fr+Le68O; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr+Le68O"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad572ba1347so191297766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749149669; x=1749754469; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCyWzEbUEgKujhnxfRhhx4MidFcQ4JFGnF47pgTLiIM=;
        b=fr+Le68OEMDvd91U78uRDJfgRq5blXkg4a5i10RG29HMoD0W1JedHnT+pn5RuXZ1z5
         085IN7AVumVykY+m3Rw9MsNmV4Z4YaAOZj8N9W5iOzfOTInwyhKM0ws6YnaD7QHIuyN+
         crzzWj4PTewmCSuYmsMzsT1Dqycs6YDJpZOlUCVZcTUenndTTrpvDZtjvrKajiPZSgj4
         uBEGpc/+vfFvs/Q258gPc/nvWfdXh8hjJu/8Yl7c3P2MSLgtpCmbnjln2U914ExB4l+w
         Podpl2ZbfiDkcjegSCuQhO6of4FbFC8IDIbktyrQqjRuNwy9NF5WZ9lxLm0t8v56ksWH
         yaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749149669; x=1749754469;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCyWzEbUEgKujhnxfRhhx4MidFcQ4JFGnF47pgTLiIM=;
        b=KXGQDfpCEzxgf1Vb5glEjA8TZ9nrui4UFPokZiE5+PXIPUDyPPN6LyeTqRG6Rsb5V4
         iAQDVAo2oTPgy414BNG/fJkYuhGNgNXx7gp3/aRBHFSOHcDzPx5BjS4GDtQSeZYNWaFG
         pcVk6Sw0bK3HizRkTR3IXLY0nhWyeZiAk7Z2NV9Wa6LyUT2Omds8W9bhafHM3lmvcwN5
         YWZADF39Wnys00c8HAcT2r/mZwos7gLjL7RCfOmmc7xS3vOGjfPtCE5CZHX+zBbOm6Cu
         rPcTNQSiT0Uxmwv8IAR/lvgukwtDUNYuUa2oHiyz2jRcwSt9WNiCn2QqWywf34w1c60z
         cnmg==
X-Gm-Message-State: AOJu0Ywp2qHbZI+oNAx+w8Y/xqFKk1MOX0OP9T4qzRyPmeBuqSgt695G
	2nRDC88k/1Ma0HmQnZV4yXc31DzJDIepEo9Ar0+TJr2NBNUID0D+egYh
X-Gm-Gg: ASbGncsFHMOCC27hHSOplO+XDjbPS1wPDqAMjZsAoXm0tcjOgj/l9yH1Qd1leMN2Xk+
	34KLeCZF0NZ7GVHTXozsTTHyXqU7646k3s/wwQmDjPQJFeJjcLN5veh1QUDud59DdhEtWGkVmms
	ow5GWiyZgHApJ80Z/VsM//OEBC2MtG1Vg+FnwXkRkgXVrtdN8OC4ShwoTLQja0EsarRBhepVZ3j
	LUJ0Ic+tQQECR7dPGolW+RagX4b7eh//NYxh2F9nDjqi36A/i6YVoLGGkopshDWuiK8eBdm/Oqu
	NGcRWAdbH/TmmSy8FrR1YlnJtX40NvpEkYKkqwFapPWfy0zIP2K1gjVlN61DA1FVBUY=
X-Google-Smtp-Source: AGHT+IHfp71hb7rCPQuJihn5982sTdI0d+tJi7YoAXJxi+1bhDi2thADAWKvfh4RFRV31m5DPPllfA==
X-Received: by 2002:a17:907:cd0d:b0:add:fe17:e970 with SMTP id a640c23a62f3a-ade1a90568cmr39842466b.14.1749149669303;
        Thu, 05 Jun 2025 11:54:29 -0700 (PDT)
Received: from smtpclient.apple ([132.68.46.77])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7febffsm1291143366b.2.2025.06.05.11.54.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:54:28 -0700 (PDT)
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
In-Reply-To: <20250605163544.3852565-6-riel@surriel.com>
Date: Thu, 5 Jun 2025 21:54:16 +0300
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
Message-Id: <9290E368-A0E1-4429-B14C-9AEF8DC71672@gmail.com>
References: <20250605163544.3852565-1-riel@surriel.com>
 <20250605163544.3852565-6-riel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

Just few small things that jump out=E2=80=A6

> On 5 Jun 2025, at 19:35, Rik van Riel <riel@surriel.com> wrote:
>=20
> +void rar_cpu_init(void)
> +{
> +	u64 r;
> +	u8 *bitmap;
> +	int max_payloads;
> +	int this_cpu =3D smp_processor_id();
> +
> +	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
> +
> +	/* The MSR contains N defining the max [0-N] rar payload slots. =
*/
> +	rdmsrl(MSR_IA32_RAR_INFO, r);
> +	max_payloads =3D (r >> 32) + 1;
> +
> +	/* If this CPU supports less than RAR_MAX_PAYLOADS, lower our =
limit. */
> +	if (max_payloads < rar_max_payloads)
> +		rar_max_payloads =3D max_payloads;

Unless I am missing something, this looks very racy.

BTW: should rar_max_payloads be ro_after_init?

> +	pr_info_once("RAR: support %d payloads\n", max_payloads);
> +
> +	bitmap =3D (u8 *)per_cpu(rar_action, this_cpu);

this_cpu_ptr() would be cleaner (here and when using rar_cpu_mask).

> +	memset(bitmap, 0, RAR_MAX_PAYLOADS);
> +	wrmsrl(MSR_IA32_RAR_ACT_VEC, (u64)virt_to_phys(bitmap));
> +	wrmsrl(MSR_IA32_RAR_PAYLOAD_BASE, =
(u64)virt_to_phys(rar_payload));
> +
> +	/*
> +	 * Allow RAR events to be processed while interrupts are =
disabled on
> +	 * a target CPU. This prevents "pileups" where many CPUs are =
waiting
> +	 * on one CPU that has IRQs blocked for too long, and should =
reduce
> +	 * contention on the rar_payload table.
> +	 */
> +	r =3D RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF;

Do we really need r ?

> +	wrmsrl(MSR_IA32_RAR_CTRL, r);
> +}

