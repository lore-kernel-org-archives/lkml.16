Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73822273D89
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872768; cv=none; b=IV81oDQYbZpRNGtS0sVwsfL43p45EdoYZ62bXtWu05KfVzLOiUOKp6B3h4fUb/ZZHhboDrCg1RMhTAk3KFy4Kp5RWmOYTKvfTNUVLP/UvmV8KcCNcMUqJi4QeQ2XDsuHp03LJHS5zflCM9P86esTZVuCGuj6cUk4ulpD4723xPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872768; c=relaxed/simple;
	bh=htJZpPOj4gZZRU0I+jiYOIF5YRNV0fn3GX0M2AlliDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWZO/Fqj5VEwXM6MI+pZYe2r84+WBsMZozfW8Npo9evi5No1uhRedO1adz8pdRnM6lNuFJz1skMMHRVtD3VcgG4ZkS1m7enAREN61Zl5v/tdMmpgGzlGMj1J5rw/Rn27X7GIJUy3oS5YpuB/AUMskaCQRURYBS+H3Skd+EFyFSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oaIoVQBT; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oaIoVQBT"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a7a8c2b7b9so42270501cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751872765; x=1752477565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTVfC4cPTOGFHouVuim000ml3X3p9Az99Bki20NcXwY=;
        b=oaIoVQBTwC1tHoM7er1y3GzkdMZXtjLOFvV5P9BLDyFA502cxxz8LC1SSynprtri+Y
         KpCdGIcxVmLc05OMITGAJfXmayHqPZFept6SxGYm+m0AsZzFDmkJAhdezuwkP4tFKDD0
         WTzAxzpyvByFpYOWbxEz//cHeOZegaWkag7xkGpSL/cSNbiLvERC9fxeLj3Jq8uMuIAw
         cVEtIQaJzBvoyb2qeBNVdR6tNgK2scOrKlgbKMR3+xkJ8XINWVl6tPnQRyDaHG5Yqm3s
         zRxAP6wHOlm4XxAq1RmSfOxjm45Fe8NiO1gafPpDdTK77wEVqJ5C7wn+lvksJMNPV9Ta
         uo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872765; x=1752477565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTVfC4cPTOGFHouVuim000ml3X3p9Az99Bki20NcXwY=;
        b=JFKYev4Ta8CHasl1L77RoyUkBJOJUG0Ejovc7AN08Olj5cQviKcgymy3FwOlu+fByc
         PBOmg59FxgtLpWsAmLxyXj9b0BfiCelKIoXMrir90TsvqZ0jIADRXBsd4mzd9ECTsR4W
         9mxg+NHNwKtsRZfDSLC82YONRPsX4CzSzU0PV/z72DAQWQGCtQ5PHMvCsrkNY1Mm10tF
         QVU3irMr8gDcMYPkG4dvklzM8+sLGdQrWy+A//vtdeeyTb05X3XFFIrLzIP1dshv15nt
         aueCdLG0nt0CW6Q/KKk1fVsw4I85OHX5urBR+QyNG6iv+EJdhfIp0wauyKrbqZ8KjTa4
         qK5A==
X-Forwarded-Encrypted: i=1; AJvYcCWf0XgBjOA1ZaASuiqsjDI7Jn2GPtlBv1Fat70NwQcfM2tAph1B4SE6pgA3czi7KC7AYGcR6mWiZQQsyes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0w+O4HLBtgBjWPK+4NYlZalEIVgED7OEm19eTOlwdXj+cBet
	CGf3rQGg18NA6qPnxhA7Xs3gfZSmXJbTyz2Gt8/XQ2x1pTGkaJd0Hld6i9L3N8ptrRficshGX6F
	NO7M/WUQEgck934rCDsZw5B3elidwsPUce0wM5BC8
X-Gm-Gg: ASbGncuVQkv55l8qjWUeMDl+oe9g2xblOSbmz4rd/QgDWvOidjBE1RcF6Kfp8T9AKqM
	pISsBHSyBsISH/ZBUUwPhcAhvYquzZzDDoNv0T1gufyhUCTG+y9xAl+Ni9Aev6KjtlwjUjpXsBE
	mLeITCt4fVEhpPiD1vbRGhkuki7ggkSWGSLCkYxOOckQ==
X-Google-Smtp-Source: AGHT+IEYyJhquDhXJu2A8CjIMcrkTyNJiyOZCUfQrqQPO5fEMO//qsgPpSXFGCGxLZ6mkwnM1V3ab9TFgsOoAydVU/I=
X-Received: by 2002:ac8:5fcf:0:b0:4a4:3d6e:57d4 with SMTP id
 d75a77b69052e-4a99883ca50mr157286881cf.46.1751872765053; Mon, 07 Jul 2025
 00:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1a24a603-b49f-4692-a116-f25605301af6@redhat.com> <20250707061707.74848-1-yangfeng59949@163.com>
In-Reply-To: <20250707061707.74848-1-yangfeng59949@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Jul 2025 00:19:13 -0700
X-Gm-Features: Ac12FXz9Oflp4WxYHT8N81vIRj_r3KU6iZACjxfFM-KEdW2Z-wtBpQlqG96pyAg
Message-ID: <CANn89iLPYTArYRBKQmXF7TkcUxQCK53SJuAwmZY0GCxdFL7iNQ@mail.gmail.com>
Subject: Re: [PATCH v3] skbuff: Add MSG_MORE flag to optimize large packet transmission
To: Feng Yang <yangfeng59949@163.com>
Cc: pabeni@redhat.com, aleksander.lobakin@intel.com, almasrymina@google.com, 
	asml.silence@gmail.com, davem@davemloft.net, david.laight.linux@gmail.com, 
	ebiggers@google.com, horms@kernel.org, kerneljasonxing@gmail.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	stfomichev@gmail.com, willemb@google.com, yangfeng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 11:17=E2=80=AFPM Feng Yang <yangfeng59949@163.com> w=
rote:

>
> So do I need to resend the v2 version again (https://lore.kernel.org/all/=
20250627094406.100919-1-yangfeng59949@163.com/),
> or is this version also inapplicable in some cases?

Or a V3 perhaps, limiting MSG_MORE hint to TCP sockets where it is
definitely safe.

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index d6420b74ea9c6a9c53a7c16634cce82a1cd1bbd3..dc440252a68e5e7bb0588ab230f=
bc5b7a656e220
100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3235,6 +3235,7 @@ typedef int (*sendmsg_func)(struct sock *sk,
struct msghdr *msg);
 static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offse=
t,
                           int len, sendmsg_func sendmsg, int flags)
 {
+       int more_hint =3D sk_is_tcp(sk) ? MSG_MORE : 0;
        unsigned int orig_len =3D len;
        struct sk_buff *head =3D skb;
        unsigned short fragidx;
@@ -3252,7 +3253,8 @@ static int __skb_send_sock(struct sock *sk,
struct sk_buff *skb, int offset,
                kv.iov_len =3D slen;
                memset(&msg, 0, sizeof(msg));
                msg.msg_flags =3D MSG_DONTWAIT | flags;
-
+               if (slen < len)
+                       msg.msg_flags |=3D more_hint;
                iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &kv, 1, slen);
                ret =3D INDIRECT_CALL_2(sendmsg, sendmsg_locked,
                                      sendmsg_unlocked, sk, &msg);
@@ -3292,6 +3294,8 @@ static int __skb_send_sock(struct sock *sk,
struct sk_buff *skb, int offset,
                                             flags,
                        };

+                       if (slen < len)
+                               msg.msg_flags |=3D more_hint;
                        bvec_set_page(&bvec, skb_frag_page(frag), slen,
                                      skb_frag_off(frag) + offset);
                        iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1,
