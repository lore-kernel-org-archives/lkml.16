Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C5A217712;
	Wed, 16 Apr 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826593; cv=none; b=PLKkO+pEerpJzrnHtnoLvY6sN8A34f8AXbhmNKZgqVSlw/zf1vhhGcPhw1RH3KDY0e8a0UJCYM2r4xxrhG4Dnze2TLumF/6cwe0ac+boaFAquov2xX7Nw4cpcPEcWQUiEIjs4mJ6KnbIl+JJC4kf8z2hx3ezsXYjN6efQB1dcbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826593; c=relaxed/simple;
	bh=OuleikaC8BGcJrE4pFFfmyLpEGdaMyvqvwoOlVQB0yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dgt0hURu4pMn0QkhV/3Ot9fuvQpXYKre4cpWXLj7otWLQriuLvYm98cqwm92/GY30dA0DW7m7cQBRs61S6g4rFIt51u+E330PeDu39KuILVwCwQsi9Ru4aa6lt20CT4x95gcCQMg/48NR5CdHr5STwO+gtwQbKmu5uVomLzne+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBSpj43s; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBSpj43s"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e6e1cd3f1c5so5799823276.0;
        Wed, 16 Apr 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826589; x=1745431389; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OuleikaC8BGcJrE4pFFfmyLpEGdaMyvqvwoOlVQB0yo=;
        b=aBSpj43sqJo3NnQF+lPR2pJKLO8ilC8Sgv+JdncyFuAEWX96YMQc7yzyos76IQ3PZE
         DqJHx7P6jOivmDueOBPuEpjllXUpM9REqk6PlZR4zCGVm/mX4NqRe9UXqiOWuvgYRO66
         +V9ETMXh3dPbyymEZouacOUShbUrUwxl9vmC4ABaOTS1WQk6Zybtla+rMSdIyMUaV8ZO
         LkvwlxN0u15+ss/GEvA4ULhdF1YbJglb/6zGIkJKmQf1/lDqG07WzdgxwAkyrbmNWml9
         +sQLSh3QAgysbGXvj1Ep7BWibLS7na398Z0EaLXFdl1CaAkHTkm44ua4ZG4aCXn0gPXq
         C+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826589; x=1745431389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuleikaC8BGcJrE4pFFfmyLpEGdaMyvqvwoOlVQB0yo=;
        b=KC6AIXpXipetXL1Q94w0F5qj3Iaq6u3AhTnVHoU98rjf8++UboKX9e04Ipm37rnWbJ
         zKzp9VNEMlRhXJOgIxf0c8xUOP2UEgLRnAIGRE6XyK8U+uqai2l9fr9JETrULmnpGzRM
         I1jz3aL1wYQk40COz8pHimCaWADeqgPKTniYQKIyWDLc9zRmyNz0uImDzm8zcJ04IgJg
         /h5PVIXoK9I24u7X59gNC50qHyEZYoZn1Uw0oJ+cRCUGgjff9ga/wP8t/ff8YeSizwCx
         enfnKdr+RsHOWiv7vn1MZBy9v2GU0FJmAAIfiB0lcKC9XCTLQqx6IyXVLEkjM7OC6SKN
         GC4A==
X-Forwarded-Encrypted: i=1; AJvYcCWfkPxd4xqNHGI8qVZkTpzV4mqsd8Kqq4EXXr0MlmM9vyT1Ggrzrllrk7izxc62L4oqFKInhLTzIh85reU6@vger.kernel.org, AJvYcCXAYuuY4MYG1LDhlZH8l3Guy1F9Gej0Rpk/n1TBZCe3t/KsOLmlW9sRgH0pcgUP4myWA0g/mWuFAWv1@vger.kernel.org
X-Gm-Message-State: AOJu0YyyD9p9loy3yUQZRozqRrE41OMx6kK381SyynCYg3Wh/Be+8Bv2
	BnRuboJ/ZqePKciXxH6dVCCUrSxEd7X0WfzC/wYbP3gSI6OY6CLZvON7IdXJ5PX58sbTVGhWP83
	j6i6GoBNswHrYkDBeEj/xdhH995s=
X-Gm-Gg: ASbGncvB+rsu4QlnxVd1K1DVeQJmBMPeJHiXino7l/M4kw5k7U6dDiDbW1axF9eK63j
	YXv6h+I8kGrtmmlzuGmOVbgMtynbqo0vcg6qudS0VGQ4t/1SmZJkWXWngf8sAwH3BlbCuH4qdL/
	Jo92fqD2l1vURlr8xkP7tmftM=
X-Google-Smtp-Source: AGHT+IH6d5sLoHITBH6SHxSf1RGZPD/HNoPd8+EbPoaGxQjpd/lJOJNYxTJPUBArOhh+2j6JjAatI/5tcLnsRf6twDA=
X-Received: by 2002:a05:6902:2681:b0:e63:5946:940d with SMTP id
 3f1490d57ef6-e727593ed18mr4101928276.20.1744826588741; Wed, 16 Apr 2025
 11:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401233409.3215091-1-william@wkennington.com> <174369144385.3206748.4237732855581471096.b4-ty@codeconstruct.com.au>
In-Reply-To: <174369144385.3206748.4237732855581471096.b4-ty@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:02:57 +0300
X-Gm-Features: ATxdqUF6Nm_u6VtEIg2hxnlKLINoNWGGUs82xnRZ2T0RroYrEysMTsGQiBKmBXo
Message-ID: <CAP6Zq1htTYeMojSATXEiAuwQgVzD-hyrEFx5ia2iuURZ9ZnZCA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add OHCI node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, "William A. Kennington III" <william@wkennington.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

William, thanks for the patch.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

On Thu, 3 Apr 2025 at 17:44, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Tue, 01 Apr 2025 16:34:09 -0700, William A. Kennington III wrote:
> > The EHCI peripheral already exists in the devicetree, but the hardware
> > also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
> > works fine for this device already and has been tested on real hardware.
> >
> >
>
> Thanks, I've applied this to be picked up through the BMC tree.
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
