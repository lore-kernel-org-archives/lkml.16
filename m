Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3CD1DB154
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776389; cv=none; b=Up3DGXVkGGSlpchOVl2TlNsbUrj5M/wPCYzoeFqMy7/SnH2OTmaVSlf8RtVmvBln4UMe2LDjWPX1yZ0wx+KRRiLIwFr8g3ZN5xVyKvrbjpdeS+9+1rXf60BUBf+VFKc5ntLAiU+hfkixrIhjWEEyRT8u4qtlKbRKymYNN3WwCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776389; c=relaxed/simple;
	bh=F1/0cHmvruih221kH6aWSlZC5sD6BkHLnUQW5KdapX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mxhwgk5SN0PFo3r79t3qps3wLqBCnsDPeb8l7goASN5Wlua0AldHvT3oBZdf6t6iXqmKWdDZ8PdSjg4hhKBb0ihetsU59KK/Sxqe95CvYe+663AwiPuWPj8XCQuz3wz5wjitlofgLe6OzNVpOPLE23iT5vjIq+Q0GqHOs/D+8vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PO7D72Zq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PO7D72Zq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso2690101a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743776385; x=1744381185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4feMGy3p1zUobV244140u9UEga2t532jHyyL+FMDHoE=;
        b=PO7D72ZqgrilzdVK1s5aSP71ZTxIFTTFgpUBVNGSbAKi/nKT6ehXqAnW0xnMKbkwTr
         YQ0yA4Lj37rFHRpq3qvQFTY8OXsCOoROlHQl5r1TlltSOYonrvmNtHK9azgd/VNkezwm
         AxCl7Dn2FtKwKpn2a432RhXASGPWfKYZ5bW1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743776385; x=1744381185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4feMGy3p1zUobV244140u9UEga2t532jHyyL+FMDHoE=;
        b=vYgmKxE1qhxLDSJfECkZ4vgaD5dNCZHZkIASzRsfuPNg2jhN5Ntwu58K1svJBbT4o6
         XSZrRrU3/aDoYdH8J8IYwwofOYNvHTbhpiEQ2Ezk6o+dqFrk0L7JxwEJDW4UdFyU0Ntn
         UYT9suWga2KGSNhBSTP+Y58gTCPGQnRpk6dyHYSiCkc2EpyenX2bG97HR5FrZwiRYYEr
         q0rk0a0Si7EzI7pidaUM1z9D9rVm7XPWxV1q6lVBwI5DKpSBvNH8O2BYELzyp7xThjS1
         cIeDVa/WOdXbhD72MDZtLmy2xOXZdpXwctRPzEiNDtLJ/CuZ41p6mCccgBVloiFa01XS
         mTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7smVRflQO0CoR3STAk0obinjY1FVNoIMGOOHN/l2xfGO1UNXdkWRrBsEtS8ODYeL85xYFEGczaVDz5ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyygh/LJgIIRYWIzrx05ZJHeM96OFzbVGD2ifhfvI9Q4zTLqs9Y
	YuYARwJ3gxuAQ5LyjT9KKmZuYVlTSXqEKDfucz7GIIG9p0JtpmOkVZRA7jmv/uYfK66MQT7hKE4
	zbRE=
X-Gm-Gg: ASbGncuMXoZJPdtzrZssiui/h8JT5+bKxrO12MIcOHgkYfwmslzGR4yj0479K9qmvA2
	5m2XLe/BLyGgLdZPUXvXHFTBFbUMj2MKB5Q1dzBNiJLZwhWI92O2RLKOzllJhLZg/aK7jsTPmph
	DBwlFkyRUH5g+2HnbOvcwED0nkl+YE/l68NvbBlNXCGy4oA9nG0o6/iPMte6xew3C9coucVhBSH
	OikHroRTp/h4ZBHMmCFRGKQ9DdkYx/ex7/24w6FF+xjAssVVK2+cXRAnhrt/woH6Hqs5wux2DQe
	rfRJpihcsJZ4f9IxeGZBbdJDyjk/gtP7kpznEdJtM0on09qNUVBvshhKEW++Ers//XP0r5FckJv
	N3mT9oKsROgPFFSaJQIE=
X-Google-Smtp-Source: AGHT+IGSkp3Hnj5HRFd16NSPRtSmfZ8WmAAVGo1tHaQRROO1ghXDtXfEDe+Xg+MfHCnkwrOtj7LocA==
X-Received: by 2002:a17:907:988:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ac7d166a5camr375870566b.3.1743776385483;
        Fri, 04 Apr 2025 07:19:45 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe99b30sm264616166b.58.2025.04.04.07.19.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:19:44 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso3267139a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:19:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj4+iYlXGYVNvV6n0SwbwFxxhGJB6qtjmi4FON5xywZnTRwTB2Cj0pE6rTs+COUSYadSY2WLdqAwDCg6M=@vger.kernel.org
X-Received: by 2002:a17:906:478d:b0:ac7:982f:c299 with SMTP id
 a640c23a62f3a-ac7d190fe23mr315600266b.38.1743776383893; Fri, 04 Apr 2025
 07:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322-vfs-mount-b08c842965f4@brauner> <174285005920.4171303.15547772549481189907.pr-tracker-bot@kernel.org>
 <20250401170715.GA112019@unreal> <20250403-bankintern-unsympathisch-03272ab45229@brauner>
 <20250403-quartal-kaltstart-eb56df61e784@brauner> <196c53c26e8f3862567d72ed610da6323e3dba83.camel@HansenPartnership.com>
 <6pfbsqikuizxezhevr2ltp6lk6vqbbmgomwbgqfz256osjwky5@irmbenbudp2s>
 <CAHk-=wjksLMWq8At_atu6uqHEY9MnPRu2EuRpQtAC8ANGg82zw@mail.gmail.com> <Z--YEKTkaojFNUQN@infradead.org>
In-Reply-To: <Z--YEKTkaojFNUQN@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Apr 2025 07:19:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjGb0Uik101G-B76pp+Xvq5-xa1azJF0EwRxb_kisi2Q@mail.gmail.com>
X-Gm-Features: ATxdqUH1fche2EeY8R3txz2bZ0obPWI0l3w2GZ5-Xx7oiLcX7YVSPm2_dMlQOXA
Message-ID: <CAHk-=wjjGb0Uik101G-B76pp+Xvq5-xa1azJF0EwRxb_kisi2Q@mail.gmail.com>
Subject: Re: [GIT PULL] vfs mount
To: Christoph Hellwig <hch@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Christian Brauner <brauner@kernel.org>, Leon Romanovsky <leon@kernel.org>, pr-tracker-bot@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 01:28, Christoph Hellwig <hch@infradead.org> wrote:
>
> Or just kill the non-scoped guard because it simply is an insane API.

The scoped guard may be odd, but it's actually rather a common
situation. And when used with the proper indentation, it also ends up
being pretty visually clear about what part of a function is under the
lock.

But yeah, if you don't end up using it right, it ends up very very wrong.

Not that that is any different from "if ()" or any other similar
construct, but obviously people are much more *used* to 'if ()' and
friends.

An 'if ()" without the nested statement looks very wrong - although
it's certainly not unheard of - while a 'scoped_guard()' without the
nested statement might visually pass just because it doesn't trigger
the same visceral "that's not right" reaction.

So I don't think it's an insane API, I think it's mostly that it's a
_newish_ API.

               Linus
