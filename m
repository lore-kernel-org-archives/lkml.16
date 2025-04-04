Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167DF1CD3F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754758; cv=none; b=QnlUk+6QjNvAQAko9a0m45bf4lVf2sQiwQKfLtEGg+/+IinBWs8drcoj021budRlrReRgNPR222FuxtnDkRyPim736G6BIaUmSY69lmZvJGG7PqOwqhiMrSqJ1wGe4QaYZfQ7wpe7LLhXLhC/Z/wleTUBAt/+hgfEqieJorcbRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754758; c=relaxed/simple;
	bh=UnTiiwGjll352fuy38kYNHOtcgzcSSL7sIaeSAESYPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTAAO73mdryrWgdX3slPB9q7OdDthYtkvqFvBIufe/Ti0rTKfY/fyue9Hpl9ghWdnQL3LhEx831yIaeD5fj3ik6FUfu9bnU+yNFVtLqR/nvPxFVFvuBUdvggmgYhTz5/yTkZGAwCPn4ElOmMTn+s8FXGW5iW+rt3LKknq9HliNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hytrM5aZ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hytrM5aZ"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so866388e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754756; x=1744359556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnTiiwGjll352fuy38kYNHOtcgzcSSL7sIaeSAESYPg=;
        b=hytrM5aZRVylXvldFUnmUA1zOO4KcugcSVPi2kn2HeF+lxWy6UWcBwHAoXRam7dAx1
         Zmt0R0y8qrO4V1T5yLiOH16I1/2yIARmNFN8RaniKq2frPMwTCNlulxkwa+NmMY5HUfh
         SR7dRH7rE4xgoGy3dZb9qSd0G58Ssi8dEO1/jPhz10LMyYkP2ACPORCdHJep9NTnfAl8
         x0uzE7bcWNGMBQA3tpyQCln32czTlBfE77CHRFil15BdDsoy7LlOCKqUCR2XSVSlmTzE
         MAXVfRAMHsQ+WQLMUm7OWqovsoAdsfxhWzSLMyk1pJDArXHzIkqQIxYVHHTNngLLwJ8h
         imVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754756; x=1744359556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnTiiwGjll352fuy38kYNHOtcgzcSSL7sIaeSAESYPg=;
        b=LF5VbqOI1OJ432VTPGunfsNMyjVdV4R65n2jssFhQB4499AJxGdTWh296t7LKa/Uft
         g0R5L1vujLKYnqpEa6hjpBSSz9Khsh3flEjxjsLI7kkwupHwkI7DcAXRZhU3ht0sDApK
         2B2R43nt6bXfWSpoV/yah+Pjtn8C9nvQqjzvtU+wlGs7/7ai1QVaBdyB12D7oqIlvqX0
         HoTOHnU/g+CoGe0GOoxx8fBIAvc9qyJl2wMkoPspbWFUpvKHIMBNPta/4cKRLYQUr1Xe
         lJm0CKl+JfyZLTOCXWmEe14ka71K19vYhxwGtuRRj7yjZmrVjiP3m37Z398nhBSX/u2c
         rbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5KjFtDQKnazmDJ64xKvYc8FvD0ZMSStQ8YqxvF4u5ydOGlMIRjYvnRhpZsr3xovTZYOqbb8jgxinkCNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGVex57wpNGvhksT6XF6dsNwNrbeckbX28Yyb0Y1MyjR8FneZM
	jvr8hLaLIN4az+wMh4kLffRkIjE/xC7QWCiROlzWKS+eSuHUuhC/hEwcHh3hm8RBLPUJuMM+pT3
	xlimnxpFKkh1iiTVIVkjgwCyBVQMwnUXK
X-Gm-Gg: ASbGnctF4B3ewbG4cwthP7O5lpeNBClOGz4PcnnD8k4rcWHCNMGUQPvTEIKUVEx5cgc
	YA8zO0olFJGtpxBaGxxnP9wZCxzqU2xGu2wJReSvGJCpTeKcKFlWSxGwcWJCuNieEulh8cYw2F7
	Eao09SoNGThEz2B349sMcXdmrdzPE=
X-Google-Smtp-Source: AGHT+IFtxDYsRzMSKIc0QCc2Y4WfE9Tca88AVoywoddO6xi4dtlJ7EOtWaoyu+KewXUs2h26omegK7hRdmOiZNaja88=
X-Received: by 2002:a05:6122:310c:b0:523:bf8b:5dc3 with SMTP id
 71dfb90a1353d-52765d6768dmr952043e0c.9.1743754755827; Fri, 04 Apr 2025
 01:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z++PnxFQFe+IexUi@HP-650> <2025040401-disobey-flop-d7be@gregkh>
In-Reply-To: <2025040401-disobey-flop-d7be@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 09:19:07 +0100
X-Gm-Features: ATxdqUHq9-HuOR2QpkWmZ8t-cvxT2IgQ9oi2XQCgWFCc9Q8h14HfRxpSyInJV-s
Message-ID: <CADYq+fa6veOHnQTuAh+rK03_UNR=_k19UsnwV9-vkJs8Bu34DQ@mail.gmail.com>
Subject: Re: [v4] staging: rtl8723bs: modify struct field to use standard bool type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 9:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Apr 04, 2025 at 08:51:59AM +0100, Abraham Samuel Adekunle wrote:
> > The struct sta_info field ieee8021x_blocked uses the uint values
> > 0 and 1 to represent false and true values respectively.
>
> Nit, you don't say "PATCH" in the subject line, why not?

Argh, Sorry
>
> >
> > Convert cases to use the bool type instead to ensure consistency
> > with other parts of the containing code where true or false have
> > been used.
> >
> > This change causes the struct field to change size from a 32bit to
> > an 8bit. However, the change is safe to make because the sta_info
> > struct is not read from the hardware.
> >
> > reported by Coccinelle:
>
> Shouldn't something come after a ":"?
I meant a "."
I will correct and resend it. Thank you

Adekunle
