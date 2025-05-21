Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E32231857
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813598; cv=none; b=oRzrvTOjWqkiQkwsKnYHf66+28UQtufwsPhGUwtP8MUAezqinR9Zogq1LFxPsP6DK+p+Ax+oy4HWBe521vw2ZGgEmTdXB+7spx/nTbUTwSfaSScdEiVII+tzn0q4m8WYZHx4fvuWwjEmGuOG3r5ZDs0Vrb3MgtSAP2dpiKVRndM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813598; c=relaxed/simple;
	bh=oreHSgri2cfnKtkxjkpiXf4vyARssVogaa7+aGSrTHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wy0fUSrEWtUVqalqwei1k97o6xgWjN1KbsNsZtQnUOdPtJTJmrBHvFirrx3iSF8tpu6uRwJu0Y7m3QDYGrNUqiaaN445lrTMBPpLax69K3H7dVfLZLIcYRKIaR6qv1CwtSreHTxVLygFdJ2+C6oQNcsyxzGm40qYYbpxM3bx6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngXfwcoJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngXfwcoJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c9563fd9so2967581b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747813597; x=1748418397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pilOcdT2VkT2U8kVqgqtToKFgXk1Tev6+CBnmTk+fE=;
        b=ngXfwcoJXyzp8UOmJP971hTcVk/+pzoPN3TL+H1ucTq7v4kGSw7Uek58Fw+7Nye92a
         Ag2SaRJQ8fKYE8cemC/RSlr8UEnBio2/5nC1pJpcVnLyhNEbTwVkDp9qaDoHgxI6S49t
         xmA8Ea1JrJpEgOvqgFnaZ1wsTkIqa45td5rSHorPe78GJ2tfi20h5jp9n/PBEHH78aca
         BniqR/Rpw3Oe299w3wRIkC4eV5e0PV7OOu0sMSHU0UTOMfYoVBbX6U9M7WdCsEBN186y
         BhXD8Kri0DMYFUzzKYSUIMCE9xRrVNHlQ0bisaWzeCgvub021hyIKlKMa9Y4tDxrXbec
         EuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747813597; x=1748418397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pilOcdT2VkT2U8kVqgqtToKFgXk1Tev6+CBnmTk+fE=;
        b=MzuiIwlJwK+6CN6+liulqYQFe/8Ghy87JH/v33qrXJ2LTtj0zg9R5zcW0DYHclA71P
         VtC10W9ecgmBkNJGAB3qN2B/pRUcVb4n/Fy8jhcvkCmnJhwmC3hip1MIYaRqqMkMGggf
         pP8n+5A9GK9dSQwzbDnf41DHOaSxp414z9LG8OHD9M+/5akYDPfSil21Zq8khnlpFRg8
         /P/o1D1j2XsBzLznYQvCzg5m+D3sNz8KVmZPAD1rJPGVxHgizr6w53EFVTUDtSrEVRF2
         MDg1vAKtmp9FqTc70+I3M3Jq4dlPBSPy3LGjvBXmDm4N1aM3wr4fepivB5GuVynKP0sJ
         b/gA==
X-Forwarded-Encrypted: i=1; AJvYcCUaVqofUDGNaoLHeikqTHTi5pk3FgUXWArs8absQpCyibFcJA50Y+ek+UQt2pPbfSPerhs2VZL39wYOz60=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR8pWX2emrjQgfQJ4tlsZhtwKEQ9Q4BOrKlsTGt4ipP6vtP5yG
	05E6ZnvdHka0v1Hbsekl/02VxnXdRnKSHT+vPuNBVQbEYcShw/0x6cLgFB13woX0x/8=
X-Gm-Gg: ASbGncvZAmHY1psUZ4g9/czPhHq8C3bOggzvxTfh3fmS6zuIsvcE56vUF666544hx5i
	Frd4CFDD6SMdzK/aHpVV9bpFuGEfvJKUxK5zV9Wwt5bpMB1gN7dlmgsiFz5IX3yj+pVO4r4jnL5
	12YRhleJ0rqmp/R2KnhZyX/tq4alfQRf86lZMAe0GvWejpr2C4eqbV6sfuXLmVcKC9/9uL20Jmk
	aWwoYIlW7BZsQyfWO7dGqnVdu2+n57TXHy708wV820nOQ6dqzXR4XW8wOOV7V9/eRTwAZUsec/d
	Vce/5sDMMDKcS6CK3/4st9ItT8HCGTCE/DgO1kp6Rnxu
X-Google-Smtp-Source: AGHT+IH93EkCLEEdKAJhbPek7T8TIC1hOKN/VmJI8xmXdKi9w+hCClmhOIHGlFmoeRJeKlWx3PgC8Q==
X-Received: by 2002:a05:6a20:734c:b0:215:f723:81b2 with SMTP id adf61e73a8af0-2170ccb39c2mr29076396637.21.1747813596705;
        Wed, 21 May 2025 00:46:36 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de111sm9030991b3a.3.2025.05.21.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:46:36 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
Date: Wed, 21 May 2025 15:46:26 +0800
Message-ID: <20250521074627.4042832-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516152355.560448-4-cleger@rivosinc.com>
References: <20250516152355.560448-4-cleger@rivosinc.com> <20250516152355.560448-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Clément,

On Fri, 16 May 2025 17:23:41 +0200, Clément Léger wrote:
> +static struct sse_event *sse_event_get(u32 evt)
> +{
> +	struct sse_event *event = NULL, *tmp;
> +
> +	scoped_guard(spinlock, &events_list_lock) {
> +		list_for_each_entry(tmp, &events, list) {
> +			if (tmp->evt_id == evt)
> +				return event;

`event` is not being updated by the loop and therefore is always NULL.
Did you mean to return `tmp`?

> +		}
> +	}
> +
> +	return NULL;
> +}

<snip>

> +static int __init sse_init(void)
> +{
> +	int cpu, ret;
> +
> +	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
> +		pr_err("Missing SBI SSE extension\n");
> +		return -EOPNOTSUPP;
> +	}
> +	pr_info("SBI SSE extension detected\n");
> +
> +	for_each_possible_cpu(cpu)
> +		INIT_LIST_HEAD(&events);

`events` is already initialized.

Qingfang
