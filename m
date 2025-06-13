Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142521A3161
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749776040; cv=none; b=utJP63q+S1ajNpK9khcptpCzccjTQqobjIc2FpX1ywmpYkmCWdtR69biGVU7i72lTlhk6o920mR+hH8e5nna9BoFK2VunS6XL2oWXz6RK1qFLBrn+iH0Tseu5UGS5NSWoQ8UnT+qqXt5gdgNlvLHdgSG+J/RA0V6lzPS/GrITRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749776040; c=relaxed/simple;
	bh=/Q9h3H5ufPDxJ9IRGHfHjeJSiedw9DUTIyBbkfL9iQQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ciKBDo42b+d6ypzMhqzdQX1tKUjn8n6EpmgI6SfahqNvrzijqoKDawNMD9fzIi2YJ36TlRtJTg12ZzRSMJ7Ybnls8jLao6I7OVtHKqTE2REwbcq1Xlyyw1yxiLw3L4wTlS+J0CqZ5JBTIAq0Yv/gcBPfZZrey5l78E8cPZ08Gkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HeNZTI3F; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HeNZTI3F"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so1030574a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749776038; x=1750380838; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7w4k58YWznvMshNuutdWHXlSrz7i5+GgLwpYq+uVRJo=;
        b=HeNZTI3FcRNUggEROCoJD2Ij1bCtKcisgBtlzLuxm7H4vhGAzsP4QYZ0q0m092mfkw
         +dZqPXWDnrips37yld2Xqob1iLgRZ3u2oC23/r1oeGtXwZ0sQEJeUkW6fKOQrJIWiSdL
         rOSO4QV6izfBc54AieeJ6KYRNcZx1Mivh/6dgl11Vywfx/DQxeucbEdwsNS8Ls2o53WU
         wbkbENxf3o6kY/BzpPb6cciBQROAow0X4UVnCNuSuGPDAS9Quek7t7dir0HnQLaM0VNG
         OTlWpgUperaDud2UHdGfI0TGmjgd2n8L8yCIms/QTul6wCW2aBiw8e3jZ0FoJPBLauQU
         a7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749776038; x=1750380838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7w4k58YWznvMshNuutdWHXlSrz7i5+GgLwpYq+uVRJo=;
        b=cvIwZA0Du4qDFPoS8lRfEzMp9yViEh30OQvHoqMgTzzMHtWMVAGEMYLtrv1UaAtrbG
         RMF6BM6p7zIGryhC4YvCP6jVAOwfka5EBb87bbsHMNQwDNd9dN2GhP1bhIg/kcZs566A
         Gg7J0wcKRWTVJyV6PiGjESiSDBx23HoachWCmQHoM9SRpmpAiX/KjmyY9iWdm+ttx+f1
         PiUSVJPt39C2sr3fbPeOM1E1/EdC5pN1+5DmbZ1RafpksywLQfdiCVBgPcteCnJjSbr6
         NUYRvsX/zBKfTst6+hqyaWIfYh6F5LI58857vRDFLHQStp1hmFxtir9uF+a9dcpjLDZD
         6u/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKP9i09o9hDKkoX07Uq11YAI3AV/rkiBsb0V2nQYHJk5MqlYFr5dKgXEu/i8CxNJMGzSm6yT+ehhuDwws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkVDRUeSDCTlLdoHO3cO4cEyGEdej2Zy9HhJjNOn+Goz1Y7Hx
	mCGkP5tQWVxaAK8bBv2OHRiBomVtTKaCxhoWKBuAw49d0/WQWJl6QRLyAiNiNvZlzqjgy8HHo5v
	hbcD44g==
X-Google-Smtp-Source: AGHT+IF8Mo8opBC+4oS6SvfRC+Uv35PNMIQW6VHTy6RRYqEJO0V9Hwf1DFEODNFIFbIkKRwUONFfUilYd+w=
X-Received: from pgar23.prod.google.com ([2002:a05:6a02:2e97:b0:b2c:4a89:4b36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8093:b0:21a:e091:ac25
 with SMTP id adf61e73a8af0-21fac8e62b3mr995660637.6.1749776038391; Thu, 12
 Jun 2025 17:53:58 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:53:56 -0700
In-Reply-To: <dd5fbd5bcc0e7ae9ac60a39a93ca8b747e5daeac.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com> <20250611213557.294358-8-seanjc@google.com>
 <dd5fbd5bcc0e7ae9ac60a39a93ca8b747e5daeac.camel@intel.com>
Message-ID: <aEt2pLgmIUuRJvDa@google.com>
Subject: Re: [PATCH v2 07/18] KVM: x86: Rename irqchip_kernel() to irqchip_full()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 12, 2025, Kai Huang wrote:
> On Wed, 2025-06-11 at 14:35 -0700, Sean Christopherson wrote:
> > Rename irqchip_kernel() to irqchip_full(), as "kernel" is very ambiguous
> > due to the existence of split IRQ chip support, where only some of the
> > "irqchip" is in emulated by the kernel/KVM.  E.g. irqchip_kernel() often
> 
> "is in emulated" -> "is emulated".
> 
> Or did you mean:
> 
> "is emulated in the kernel/KVM"?

Heh, both?  I'll go with "is emulated".  IIRC, I was trying to choose between
the two options you listed, and didn't quite get the cleanup right.
