Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FB303DCC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477027; cv=none; b=uKiVELns2D/zPev1bOIXa5G++D3F7l+BrugGkud7z3RE3ocU8SzSMAUxM8LRViAj2of+ojM5LTwv+iwXLJH0NKdePHuNuczFZ1XeLpMngRqBzMAccQIm8+mqbpdqrTW0bzYmV7iZt6SpjEE/C7FSdedvTIVnCkB74J/nOAd+Dwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477027; c=relaxed/simple;
	bh=0bJDOVteaT0fIBktzT/oFBf4I98xYtb/XDVZbe8sAKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8KSMBut+taD16XBmp5fkreuLuIuyEmAZ2fg/E81A4M1thayoOZEECm7YEobdNLt1tEtQERPCgznJ//dviAWTrI/Fy58/B5UJUNa44Y9FrcTvBERv1XOGED+JZqmIPR84n07U7PinieLBfFm7xHmGeuFMSG4mshLondTwRAsEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H/fiXAss; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H/fiXAss"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58e0b26c4so77948451cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751477024; x=1752081824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bJDOVteaT0fIBktzT/oFBf4I98xYtb/XDVZbe8sAKI=;
        b=H/fiXAssYsXurAIcIHiUI+Q/bLM68eizHy1gI2uroeN+oJ4L3yJY4p4owqsRhRt2nc
         v6nIPNBS+ta9Q0e1if9NaMpjt4KqTpuLuqkUyeQg3lUEqxNwWdfOyw8KYmvkv3ycPt4O
         f4zCT9lPFcPtWIGNZ1uaw/RnZIfeDiC7yGXqWGZ/ReRW8+es4oVB4+Yy0girZxP11Aa2
         x4yyASjCSmDZ56fohGiFa9suPGv5UtVbCaO/iodBz2gsRoBbNs6wa+fP2W/e3sKth1jK
         Nl1OO2XoSCg+AbeeYVlzJZGdoHVk1qxG959RIP720uVBHfc+3Z6/xtbOWWRhizqZka8/
         qOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477024; x=1752081824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bJDOVteaT0fIBktzT/oFBf4I98xYtb/XDVZbe8sAKI=;
        b=U2xL3g3CB0vZS1ArhG8QqlI6b5ef7iZNMcOKiZ+gNzwfovywu6OBn2Y1ukIjP/GtOS
         SvcK2R/MF+iHpPwtmxZQ5aIJ4Rl1H10CFCCj/+g766tZo/N2EEc99z7AkDsIV+aRD9gN
         wPC4sJKepGbPyceVUfnjpR9nKTIK5yPGWVdc9YYq4O6+oQ/zQOutfAbd3/9L9Ui7jl2H
         Uls/pN9yFpzYrkYuMqkT/SI2R6G1xSFKTl6E9D6iI9nAIy9ldVQQHVsnqFAMxh1qy8jc
         /lJXEcfSfxNF0XjJP+RitWHxvHcTcMcAWx8Ajg6jN8Ec9RUMH09G0m6k+WnEBoxVw14l
         nWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVOWO44iW+S8uKfPh7L3TmiN2nN0nuofJxNnGA/uM9hrZ22DSKvpY0GVDfDIrmHVLr71nTGca+LAdaLQZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqn7AA5nDDcQ61GuFKaBvE/Pl6I9y2Nom6Je0aZFIYmMwKhdfK
	7+D45FDVbn4WjfhbVJvOmUu9nyMfN79DLCUkd3ByT0BtsyD8q34KTE9qVomx7tuFQ1EsFVsh72a
	lsmI1kkmx6kuLnKsD3/kosOXXzEQIghhvqL5pBne+
X-Gm-Gg: ASbGnctF6J9ckUSBxikXZ/Z8e/pONChBsArqg08Tvc+5fkWszxNzaNy1M6oYDqvJ+0S
	9EfblT2eWcebPNg7GK2osZDPrZPT1iLh67J5U0IeFCkwy73+7lS5HhjtsqhcFVu6LUpt/OGKt3R
	/su/FFKx3h5w2MBsiUJOfGLMH2XR8m61W/96oNMqqPxEu5iotPEucw
X-Google-Smtp-Source: AGHT+IGq9Z584mPG2oLYqP1GYBHtqpVcMJI6LL1P1pdu+q2NESjy1sUexxwqp9IvD29zSis5S979zMhwz/13DHwayI8=
X-Received: by 2002:a05:622a:988:b0:476:8e3e:2da3 with SMTP id
 d75a77b69052e-4a987a20dffmr1712011cf.30.1751477024012; Wed, 02 Jul 2025
 10:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702160741.1204919-1-gfengyuan@google.com> <68656416d3628_25fe3329483@willemb.c.googlers.com.notmuch>
In-Reply-To: <68656416d3628_25fe3329483@willemb.c.googlers.com.notmuch>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Jul 2025 10:23:33 -0700
X-Gm-Features: Ac12FXwOQL4yM_9cJaB5mJky6waj2AdTCqO6WQ7iiDQ5Q9WVlnZqcl6YLmHyQ2c
Message-ID: <CANn89iJdX3my-yb2Mw3OQa8OX2AtkiPeuFkHP_MsWNh0nu2yFw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: account for encap headers in qdisc pkt len
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Fengyuan Gong <gfengyuan@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, toke@toke.dk, 
	"David S . Miller" <davem@davemloft.net>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	Stanislav Fomichev <sdf@fomichev.me>, Kuniyuki Iwashima <kuniyu@google.com>, Ahmed Zaki <ahmed.zaki@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cake@lists.bufferbloat.net, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 9:53=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Fengyuan Gong wrote:
> > Refine qdisc_pkt_len_init to include headers up through
> > the inner transport header when computing header size
> > for encapsulations. Also refine net/sched/sch_cake.c
> > borrowed from qdisc_pkt_len_init().
> >
> > Signed-off-by: Fengyuan Gong <gfengyuan@google.com>
>
> Reviewed-by: Willem de Bruijn <willemb@google.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
