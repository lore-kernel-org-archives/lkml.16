Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A395615B102;
	Sun,  4 May 2025 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356141; cv=none; b=CcKEpN7R8bE/MprTqbRSRze0/TqWo3DWZ7OFVrbuVHIRZooIXr7UI0vzktvM3FAS3keYhTMT32MpH22iDlKNfVUeWeIdJ8tKAKAHCawwQZ1ePJmBNKVXC2Vh/fsgRUxKuHe+OsYnKhASs+S5Np0jG6BOzXqL65JjpREZHVTlNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356141; c=relaxed/simple;
	bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/VNliOdEUvHRwREPNldcKdSnojuzp4wOIF4XAJ+7Kesf0EJMKszmPo7yzgc195w733yBLz8x4iQso9gBZcq1rMhaLO2UqOAA0hFqJjPme24URHY1SAfBrHvhLdyVJMGBNp6/4hjezkzo24RPb4a8IbcPf9L9GgaVMGZS+SYh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/iVzj/S; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/iVzj/S"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ace333d5f7bso653651166b.3;
        Sun, 04 May 2025 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746356138; x=1746960938; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
        b=j/iVzj/Szpd9lYM6phei+QE1R+3ne5hMm+NdQLta0NXG1kpDU4CIk9Z86mECyYJyJI
         bojK75W1yDtOCS62cMOHgp31xrBtOMc5Ivtyjp/cWP1vN4h0qqNC6eVBWB23wXRZOBSg
         k5AYTafd7ySBXGwVBbdZZcf6N6XmfwGzmtZ1JmVEWVlrs5NyGRNSChJSTn8BXnxP6d0d
         jx1ZT2BV65fX29lXLN8kO1VzXCYRyyGrsdOcW+g43wKhqmB/ENxqmIVGRt2GKwiBQ2fl
         ZaXFqvFh+M+llZTUkpDiHMF65xbFvnFMY7ygtLV3OWh9qgXE/bgcVXwVYfxujbjw7j1x
         bwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356138; x=1746960938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
        b=kpkW0yDncZOZbAh9rs6x/CUMHmtQP5sUgzMZyR+JHbemtroVv5nAlgsoC3NLvv8KlD
         1J6q2JOY7/ZRY/AClequB45eofLyW54Ct7Ny8cWGdolBKdFZBCOPJjF8Tnwv4+0RMoQA
         Vl0RqUzSLGR5f8cHbBALLnsFhdcTsL1XiW8kRI+zsnFGxFMbsquwEN3S1O7D0gimWQps
         9xKVoHb98zP6YVs7Gn0BtdVnxPSteBbBDp9PY3cGjMKH5KnH0WDlyiu3x76O0ptU5gbf
         nXpsSjR01xeTijiYIFP/DxLMJkEkrw2qvD5h4v3DYaBeex/DqGz8NB3eYPcz6EWDuXvn
         abeA==
X-Forwarded-Encrypted: i=1; AJvYcCUCxdbiqby/3dUc4e2q2DJkKHn2ba0fzJn0W4HcnJwhBhjVmqf44wbKgOMUOeDZiwxJmjtu/laZO/01fMnG@vger.kernel.org, AJvYcCXVE65QaAZ2Wzv0rLtPydjO24AdgmxREXFQY8N9JmsV80bOVgQfqSzCVGflL9ojbNE7aFY8KF6jbWHo@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBW7dRCO9/usXmUqwjoIznWf/YckBEmVbcNL+Hr5CTktBSK0k
	9zHlX2vDpvHa6+nZJxVCfaGo4JOCF6GVVo+ZSP2Km0eY7org9v3tqYLPsBgi
X-Gm-Gg: ASbGncvRmvkxDe4rAUdBcV9I8/TQ+r/DuszZCG9a/nvYHIRKmDXQ6j9kXWNSrSCd2Lc
	z5aa1F+hS7r8LB/lKlSqE6Gb/cgbQUKYVBbQj1rqFLrwb1Ey6w1YqDJh5ws1N6nwMRVQKmkfufU
	iF1bAUTu8nvmOsSAQBp7rWs1qriI8jddBHFiXCA7NgbGzsVpewcQ2w02/twDVXkGUgvXh7lEtkT
	buIgkumixUKWv6lGfPZuPMZkKuzEdypC44TAQ3o/fVr8NdXnK31Ap+rXXbYe3C42Re5ACWFJoPV
	orJnzpC6cAmrXTf09qZ47lNtINKBiWIi4eCVqha0Qe2hIPG16mRyIwxUmJWIg9tP2nEkRGA=
X-Google-Smtp-Source: AGHT+IGPBRqZ8nAL71n+j3b7Cwv7/Y14UgPdPJpAj77aNr8QGSe9maFrY5B6bcLyEAGl4PoeZoym2g==
X-Received: by 2002:a17:907:980d:b0:ac7:d23d:b3ac with SMTP id a640c23a62f3a-ad1a4b3773amr291859166b.53.1746356137751;
        Sun, 04 May 2025 03:55:37 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm313852266b.1.2025.05.04.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:55:37 -0700 (PDT)
Message-ID: <284f4158408d4047a52d427c9189910064b24d97.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: switch precise compatible
 for existed clock device for CV18XX
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 04 May 2025 12:55:41 +0200
In-Reply-To: <20250504104553.1447819-4-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
	 <20250504104553.1447819-4-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-05-04 at 18:45 +0800, Inochi Amaoto wrote:
> replace newly added precise compatible with old one for existed
> clock device of CV18XX series SoCs.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
> =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0 | 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)

--=20
Alexander Sverdlin.
