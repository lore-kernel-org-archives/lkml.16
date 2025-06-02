Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46202B660
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892309; cv=none; b=HSxIlkZVey5XapzZ/L6xKyx6QieaI06Q1kdcnCQPBA3rcwH3+AZBGmGrbh9ayCoViEcbx47K13t1WzgqAKZ/FPyZCKGcfWGmU3/lZo5O+ETFFc6kO5bMIm0pK/QVhwjlgfnoj2QO+SUrJNkk2BkR8MqKcGqOBEqTQ0xGqTJxzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892309; c=relaxed/simple;
	bh=ZiKLoDClI4oGB7ePHYm/PoXwM7SZEFJ6RFU09Ddtsnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVejCVa393cCaTf50ixJIBcQHN0alse/w5nwoRGE+ApjHkpktWXLZpm1wakFcHaB55DejGhv5jHALeolEvDRXeoE3kTfePVUtvetVFvKcLCNQ51p55Bk6WuVMaVA2KUhAHMwjBqFabBP17ZykdEEJU2xzQsmhNaZ2LkREU44HaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OaaRuv7j; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OaaRuv7j"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47e9fea29easo88041cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892307; x=1749497107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiKLoDClI4oGB7ePHYm/PoXwM7SZEFJ6RFU09Ddtsnc=;
        b=OaaRuv7jmcsy/9L+RVCyYhaWHreZkfxkp/7RZQYdaB2FlIH6t3rwF4zLN3IOfSLILd
         6QHn1jKEFQxyiaTckmgdpCggnjR6VllzqcHJg3c6sFhlPILS2/mlxYBD40XkFpKXDFqh
         66uHIXc/aFdC4QL2Gv1tjKAPeOBeI3lr5s7/1HqYNm6Uy276LRSDCm9TUGSdyTGl91Nj
         bPHfCG6gjfQn1l/Pw3o87X3RpABn/lKbTbngA/5VTFAGfqABGBEhfx++7xFAFRu8oUkf
         yBBfH56S/03AttvIwD2UEWqHSGFbk1FMsPhWXmdi9lxEuB+Xm5PDxilzwDG/ndDt6B7s
         XaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892307; x=1749497107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiKLoDClI4oGB7ePHYm/PoXwM7SZEFJ6RFU09Ddtsnc=;
        b=tKLAOOU2qJAvrFL7cJO+b6zy2uC827MTjhCplmXee9zVg0UFqxuMo2a3xhkFEBF/bY
         YU7Ev8NwxLSHJxjXsttwzvbw1V1sABuWEmmWtu+XxypHvjjtkTNljK6V27Oi9Q6MqtnK
         EsKat6h8YHEKphDA2RWwA335lBINERhLrlasrAl2Msg58Osvdbi5xRWO1qZmRY85GKzn
         NdPXbkEBn+gMA1ZIoW5L/pLWti8xjrt0g7DPbG99jhQ8x8CESHDzfNy/iIRkFaZwuKaj
         qlFu8veJ2Q8WL+Ng3hbpS6+lME2KFNX0kb0fWFdtsc/yCUmN44afOfb9kVn4cya5//QL
         Zc6A==
X-Forwarded-Encrypted: i=1; AJvYcCUSL822wn+24T7AwqVIjaOg2B1PxSXzEmye/ic8rha+CP1NPgFjMgQXUmUO4gfzCAUapxW7bVXMqpSdRMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWB5RvtvfiEQwoZ91D0K70Bg2N4TpIMQsNuAExv1PRXePHaV6
	a94YkFvV7877eVYvnGv5lH3VXYo8/Sj7vpPJswCz4ubmp2wdJatGy4LveHzKbwgF2J02DGv1Ai2
	VPpjhGEi0F6grMhWsctukcxqclZcntWvCmd61iRC/
X-Gm-Gg: ASbGncugJ3Fp7DFLVOUOQBispsOcrnZWuhVfimreiTECmdTgWEufQAp2rTCBU/r7Lk3
	c0Z+j5+KDdLBPIgbS993FKWx19PA63v76AWTyu2nauysLFUJ7xWFak0vBOxfdyCtnH/SGDit66X
	TdX0cMLwJg9hUhi1m91aSepqHUl6OwqAUwXK9opztv9X5CDhzB+ZHY2Fn2rzUtRiFq40515zls
X-Google-Smtp-Source: AGHT+IFPqF6+xgf2xnfcCP8J8BR4Eaiy808C6AxSQUS0B3T49PpL0VIetrrDihRnmJ8ncanR6OjMB+yAkSST315QMF8=
X-Received: by 2002:a05:622a:1f99:b0:480:dde:aa4c with SMTP id
 d75a77b69052e-4a599ac4377mr580471cf.4.1748892306857; Mon, 02 Jun 2025
 12:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601193428.3388418-1-alok.a.tiwari@oracle.com>
 <CAHS8izOqWWdsEheAFSwOtzPM98ZudP7gKZMECWUhcU1NCLnwHA@mail.gmail.com>
 <cc05cbf5-0b59-4442-9585-9658d67f9059@oracle.com> <bf4f1e06-f692-43bf-9261-30585a1427d7@oracle.com>
 <CANn89iJS9UNvotxXx7f920-OnxLnJ2CjWSUtvaioOMqGKNJdRg@mail.gmail.com>
In-Reply-To: <CANn89iJS9UNvotxXx7f920-OnxLnJ2CjWSUtvaioOMqGKNJdRg@mail.gmail.com>
From: Bailey Forrest <bcf@google.com>
Date: Mon, 2 Jun 2025 12:24:55 -0700
X-Gm-Features: AX0GCFtdZ9HGYJjQPQrzm-S9QW9ak_wfCYsx7jU2Dvzw2QakpQ4B-b9RABc4yNk
Message-ID: <CANH7hM5O7aq=bMybUqgMf5MxgAZm29RvCTO_oSOfAn1efZnKhg@mail.gmail.com>
Subject: Re: [PATCH] gve: add missing NULL check for gve_alloc_pending_packet()
 in TX DQO
To: Eric Dumazet <edumazet@google.com>
Cc: ALOK TIWARI <alok.a.tiwari@oracle.com>, Mina Almasry <almasrymina@google.com>, 
	joshwash@google.com, willemb@google.com, pkaligineedi@google.com, 
	pabeni@redhat.com, kuba@kernel.org, jeroendb@google.com, 
	hramamurthy@google.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Content-Type: text/plain; charset="UTF-8"

Hi Alok,

I think this patch isn't needed. gve_tx_add_skb_dqo() is only called
after checking gve_maybe_stop_tx_dqo(), which checks that
gve_alloc_pending_packet() will not return NULL.
