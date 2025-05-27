Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5B27EC78
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362249; cv=none; b=fRUVdIrSwAZCXC3CJ6/ANamIf+8Q3Oa4+K3/D2nMA/Tm34jTaxGSoSSOmmhWgbLiAj3X3/ujxntrxCog2m7yS3qiI3pzAyOVEeVpzqkBHkc9k8OzzLk0spfvFxIVhA+QIk67dUCwKhsuatpfasgNPsDaEA6k0ac3xe2nIuRfqxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362249; c=relaxed/simple;
	bh=C+jtZ6M73CB86PrCh9GgPsh2zWr6HUxw7D8YoYK3uw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asCopckpEvCQSo39BHZHgx1jWQDAPWdgD6kkIkkWqyJwLo50enMjrJKkuCORw6cuAQiLCVmm4WR5vtRNQD13seCGpBgaNTcNNC7JnbQg9vS++PUIl0efxm/AdnJexVFP0JG3TD7ks5qxE/dGCudztgV/4BYD+VJ+eBU8mRjPJdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QhB0Z72r; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QhB0Z72r"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso39718381fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748362245; x=1748967045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+jtZ6M73CB86PrCh9GgPsh2zWr6HUxw7D8YoYK3uw4=;
        b=QhB0Z72rpGSMmz4oezKHETPxEVn6IUmud14dt7OGQHEIG+E5GQR7EvlicXP0tU6srw
         pDTXYLBO7pT6BRHt3b6Snv+5bW9T5HJu/b6qY3GAMwl/YmoAiVLyLQO6S64ZelDC31Fa
         OMKa3BoGXX6Qiqbqg4aNJN91uz5TUDf1IJZtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748362245; x=1748967045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+jtZ6M73CB86PrCh9GgPsh2zWr6HUxw7D8YoYK3uw4=;
        b=Gr15vfM7RGY9vfmnIUKWzTJCXAcLLaVR0NVL172U18kmgnvklfXoEUtsj2HTMFlJIX
         XUKyGyylL9jjlal+bVqxmDZ93fAeo5OjGF+bUQoiH6OTkRza8bVcK+KEAF00dDOXnT3C
         Q3Me/cJq7LvkkofO6BNutAtHZcvw8pz1WffakboXolJCyOFI9fwuvt3Oj7pvL/8h9X/k
         FsLcvc/3Xf7+feBieNOyiclzZ6rhwaoWuf0Id82KUphxN25hrwbOCQ9b6IU2B6umFHjh
         jLog6XNVhxn0hV6Jo4SY4jVKmkikG1H+6US9z13h8nPndgjJq6tpfOGa86x80DVXCeY6
         nB1w==
X-Forwarded-Encrypted: i=1; AJvYcCXs+W3VV9UaQlAKNmryQ6Wj2+NkohsRRSmJ3rB6eXExe1WSHzGMF3hCoCKgCuWbNEvUu3CqTOoz45OQH9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaYRqlfIAgHtcxAY3evMbFwvIPjVmZNB5WTW3kDW+rOnhxpqFT
	lqpy7C8MK9Cy+3WGJDi+N2Cao4u4bw6OMtZUzYFQG3yKYILhN29rLvvb5tLfKpysilPSw8q4skF
	jnU6dMq5Oh2i52MvNJ+zrF2Qz8t7/9Nqkb3iz5JRL
X-Gm-Gg: ASbGncu1h3EuDCzThKQUHhHXfJd/c6CD6RWfZ61o8B5fN+r5F2hWf0MaPDpxyiTt2u/
	7tlVG0v+LpHl4I7H0pDiagSPco7G5473Bsr+mwEEsbjqxDu0RjzwGVg0l9N1QmwLFVi+/lfOhh9
	KkslZNSTXSgkslHN35OZD6EQvPyNVAounKKGMrrySPkRdj
X-Google-Smtp-Source: AGHT+IHnxXSpwPQJnq00c7CWCY+PUWCLeRzCHONa/qE7pZ0tlcnlmLKnoWAnQH1ws4NnK/iqPjFX0jR0V3/BiQ03ZfA=
X-Received: by 2002:a05:651c:3137:b0:30d:626e:d004 with SMTP id
 38308e7fff4ca-3295b9c6dc1mr42932431fa.20.1748362245432; Tue, 27 May 2025
 09:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513210504.1866-1-ronak.doshi@broadcom.com>
 <20250515070250.7c277988@kernel.org> <71d0fbf8-00f7-4e0b-819d-d0b6efb01f03@redhat.com>
In-Reply-To: <71d0fbf8-00f7-4e0b-819d-d0b6efb01f03@redhat.com>
From: Ronak Doshi <ronak.doshi@broadcom.com>
Date: Tue, 27 May 2025 09:10:27 -0700
X-Gm-Features: AX0GCFv-bntr7V3eITdVmyrlk7O4Ra37b0K8G5XqblYoHppcZ27xPhxwkEjCxzQ
Message-ID: <CAP1Q3XTLbk0XgAJOUSGv03dXfPxcUR=VFt=mXiqP9rjc9yhVrw@mail.gmail.com>
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Guolin Yang <guolin.yang@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> If otherwise the traffic goes into the UDP tunnel rx path, such
> processing will set the needed field correctly and no issue could/should
> be observed AFAICS.
>
> @Ronak: I think the problem pre-exists this specific patch, but since
> you are fixing the relevant offload, I think it should be better to
> address the problem now.
>
Can we apply this fix which unblocks one of our customer case and address t=
his
concern as a separate patch as it has been there for a while and it
has a workaround
of enabling tnl segmentation on the redirected interface? I think it
might require quite
some change in vmxnet3 to address this concern and can be done as a
different patch.
Meanwhile, I will raise an internal (broadcom) PR for recreating this
specific issue.

Thanks,
Ronak
