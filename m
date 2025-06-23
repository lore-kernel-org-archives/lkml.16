Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F423D2B1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676328; cv=none; b=fhehE+wLfCW6BlrE+zu5wyKjzk4GznkgNALKfiG5OF5ljAjHOnBySaneSLkaH0cpe3OKCKooWZrXfGzvXt0ipfXPdGgrluHogNw1Fx5JfJtTFrFqmTtg4k6ZqOJDvxgDycQICi9xMohZFH7mbGPMI4bPfBkPP1NSiTNEEujM9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676328; c=relaxed/simple;
	bh=EErLWh9XrgJNcdZGRifMKXJSqa0n2177cUJabg2LT7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra/ddAV13rqVx4QzzHSBnvrnJoBfSnHYnmF4C2onXDImbiQFFysuC2evJF2bEecsj9R+r/wQx0RjteCF80AnEHXGquvRKAhnTiJ52F6dljwU39oAtyWFZRASqfMqJMoxgGjpujBCrFkFe7Wk5NvYhGDgLK02MRkSxiZXV04zOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AdWwGj7T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AdWwGj7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750676326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fco4vtRzYDDw/pHaJKec/EnFJ9SMT2p2BP0btZaM8tY=;
	b=AdWwGj7Tq81U9bqRrlDDQ/SPXPyVrESgYF29QkAegD062X37g/b0RZ7zRnAxmvxY35YejA
	icog1GmFHClxMvOKOEbhTVwP0bQAQLjDDMGL2LxNdaKGppsC/07mYZMrXVx6xN64piBt5I
	IrXkacpJ/f6eU2is6DoVuh8NdQ0BCh8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-QpB9tsP1PVC9ZhrawhWahQ-1; Mon, 23 Jun 2025 06:58:44 -0400
X-MC-Unique: QpB9tsP1PVC9ZhrawhWahQ-1
X-Mimecast-MFC-AGG-ID: QpB9tsP1PVC9ZhrawhWahQ_1750676323
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so32269435e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676323; x=1751281123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fco4vtRzYDDw/pHaJKec/EnFJ9SMT2p2BP0btZaM8tY=;
        b=dMPMfFR46IC1pWjrxAq4cs0IVpEGuT4W8bw3uLj9cOUSY4mCeTeK8/gBqKJznc0G+f
         txT+zNUwEfeFIpoW0oISaozSJGr+CrG9uJE+FcDqN0YxQblvG4VQMTZ2yrL4bu3+fkyS
         Kp7VHt0KIMGhHnYEuOw2U1FgjjVKtyQga0jpFpohsf3y7WyxEEjeSiBQbi7KouHlVWIR
         now1ANwh1QvVyo2RzeJDiqDbtl/0dLDERN9IKMVeAVAzOJWJB1qn4ajP1gphsnjkmD75
         zmBR6bjubnOoL1Idgh7K0pA8Os8triXcjqzlCbmXQUYbpORAUNZnI+MqQMxAcZcTw7OX
         b4ow==
X-Forwarded-Encrypted: i=1; AJvYcCXPyF2R64d02tWsDoIigsJdy3b3Pde4Gw+LjdBIK3qMPD6ogu/8/7IykjXlSJRekykB6sHWyTk1yKUZXkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQkM5gWJAOtJaLFsVZ6rM/lsZjxUzNaqqFkrLbRlWsSf3CQQS
	kQEG07uvL6RJJ+dG/TBmHan4R8ny+/Fx7CzLtE8fRNuQNS3GU9OC0m1ef32cbwi6scRYPxW/Xjz
	1PIK0JxDszjYCw9JzxR+uctAiMguxHA9qRMnG4PYtHjSD0FtzxIw+bnvN/4YyAVkRyg==
X-Gm-Gg: ASbGncuGAGJkHHaCJgwoXTtsBPJFUHRHPqSrGTQtVELpW9H45UcKFGeNwrYoTIi2n9C
	U5qwIhIEXYWsp+LOpx5dPRhcl3dDsO6aPjUhn0SGaBZnD7qEjHdrVb1TJ8rJ5yutX4l9OnDZLjq
	38oqxhpCokxKcyH4zgzzir0qeR80fAypByans2D7V48aRL/L9qwlGEOEvG9VYJQMd9HwgnXVXte
	vM9nINUeIf4c0LSeGgDktxqZshyPHRueJ0fi/mY5MzTScuN8ToEvSdwroj7r8ApzoOs6LYtTA08
	CaLhAS2+ei3FNImJhmEs1K5e/Esikvpi0CVbecQbnP5/1w+z7XcxlBhcmzD9QhCQUsbsUL1Td7T
	rDA==
X-Received: by 2002:a05:600c:5494:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-453657be65fmr102123515e9.8.1750676323468;
        Mon, 23 Jun 2025 03:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeMGWI9zXCkvZ6XaBwo/RYYoquB2fA9+J9yIDbiHxixIIBumezj2Y4ZCKG/s8zRIZRGmk29Q==
X-Received: by 2002:a05:600c:5494:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-453657be65fmr102123215e9.8.1750676323074;
        Mon, 23 Jun 2025 03:58:43 -0700 (PDT)
Received: from debian (2a01cb058d23d600538a1f8d783da59a.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:538a:1f8d:783d:a59a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm104423235e9.28.2025.06.23.03.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:58:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:58:40 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-ppp@vger.kernel.org, Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] pppoe: drop PACKET_OTHERHOST before
 skb_share_check()
Message-ID: <aFkzYKBU/c8aub5Q@debian>
References: <20250623033431.408810-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623033431.408810-1-dqfext@gmail.com>

On Mon, Jun 23, 2025 at 11:34:31AM +0800, Qingfang Deng wrote:
> Align with ip_rcv() by dropping PACKET_OTHERHOST packets before
> calling skb_share_check(). This avoids unnecessary skb processing
> for packets that will be discarded anyway.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
>  drivers/net/ppp/pppoe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
> index 68e631718ab0..410effa42ade 100644
> --- a/drivers/net/ppp/pppoe.c
> +++ b/drivers/net/ppp/pppoe.c
> @@ -372,9 +372,6 @@ static int pppoe_rcv_core(struct sock *sk, struct sk_buff *skb)
>  	 * can't change.
>  	 */
>  
> -	if (skb->pkt_type == PACKET_OTHERHOST)
> -		goto abort_kfree;
> -
>  	if (sk->sk_state & PPPOX_BOUND) {
>  		ppp_input(&po->chan, skb);
>  	} else if (sk->sk_state & PPPOX_RELAY) {
> @@ -418,6 +415,9 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
>  	struct pppoe_net *pn;
>  	int len;
>  
> +	if (skb->pkt_type == PACKET_OTHERHOST)
> +		goto drop;
> +
>  	skb = skb_share_check(skb, GFP_ATOMIC);
>  	if (!skb)
>  		goto out;

Agree. You can also refine the condition and reject broadcast packets
by using "if (skb->pkt_type != PACKET_HOST)". PPPoE session packets
should always be unicast.

Acked-by: Guillaume Nault <gnault@redhat.com>

