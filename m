Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833979EA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 03:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920824; cv=none; b=vBma60xOKHQGRzm0WB6cgNcrnglgE0SXD6oQSFoDDXmhF1jE+U2B6wMaa4lqDOYLP2OtTdbqvo+WLrS07g0GMjgdfVwcw6js2luIlonnZ01Nt4lBDsA7MVyL3Qc85gbzB0SdQr9afabp98ujs0WFONT8MV7OjzMVMLpwBj8GIFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920824; c=relaxed/simple;
	bh=SuUuFxKyZLAGBzKOOo1OIiQNWaS91RBjDVMCFq+b1Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBfzcPFQSjMkth9gfcFblf0H0/j0U3hfjkkoosS14r/kmVPu7cjpqWQWOccdTDeirrAXA1z/hb+fcwUjQuTa0ndmfqXDSQUamlkku7OY8a2TgSzYhcqjE2LafaAXZ9Z4CD5q/Jr2dy2gMH4m8rYLAIHZlnLuRvBXbHrRKcmXjjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d7If9sb6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d7If9sb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748920821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuUuFxKyZLAGBzKOOo1OIiQNWaS91RBjDVMCFq+b1Ug=;
	b=d7If9sb6+afNWKzYLjDqKRyT+eg0w37wWOnN+DhKxz/P6qcCVPtGFL6Bu3JopkjLeS4ne2
	TFAN+cq6Dw3Qrly28qASP0MDsJPKkmvFAzfAlTGpk48hq+zdws1ti9bM48BQ+EspJfrzd+
	O1FmfsX+mMzN1BF8+94uY/yc48sWaNM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-0Hctf6-KOQ2qE37AsTxsfA-1; Mon, 02 Jun 2025 23:20:20 -0400
X-MC-Unique: 0Hctf6-KOQ2qE37AsTxsfA-1
X-Mimecast-MFC-AGG-ID: 0Hctf6-KOQ2qE37AsTxsfA_1748920819
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31220ecc586so4372972a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 20:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748920819; x=1749525619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuUuFxKyZLAGBzKOOo1OIiQNWaS91RBjDVMCFq+b1Ug=;
        b=vVaywzltI27qID+4AinOgcRM87F3XGsf++h+li+gU/VkENrk51qYeHiYqrA9y8oS8w
         eI0RzQUAF1BfhB5TMkUz7pZ18G2rJOmIt2Hbk3b5U6SItRu9MGQ1Clem3S/3n0cocrHT
         8BQ1ORKd1NGHROBQ3W+HWfh2RyvF4WW8UfFYBxMwTL2lUaDt04elmV9Jkl12tndZ5muw
         xnGmp7GFNsV0oLD9eFTlHZWT5PGL/VPpQHsfdJTL6cYFqyguM11swXYD73t2R7tMQ7rt
         4Z7Upd6znel7sNfQPMkuK8Z2Pv5Lp+lkvX8Jusmqgo0DvZfpC1aFv0IQONwHzFsbIVyH
         5Iwg==
X-Forwarded-Encrypted: i=1; AJvYcCWHMVg8wrB5FKp/F0rSYyS6HwTN4szbGHPCpWpMt2Q1/D+qWt1E97HywuTNnKwzqYXeemJsrmY6VkjTbk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTRgdgKL65Kggt69b1i8cSIzFi0S9+sCtq9HP/jdfiXnh2Ixe
	w0mnTnlIxXuF18IQr/LxKVgHalLv4FCnN241VOZ4J/wqy+rwjUadMVaJ7t595d4+0vAlSxehnaA
	CMavtQMGLj5M23Tw89lng/mQ8sZLApIbS0O3VD9nuaeT/xKowqa7sVcvwDVx+7NxuC62oovWXem
	8KaCh/Lwps5BoCUpWqqE+xhuNOVPBe9jdZQanpU/5n
X-Gm-Gg: ASbGnctwlV6RdQHIh+VJczLc58nvKCFMqrUep51/xMAMz+slVTaDcOQE57BT7LWO4H4
	PuXjgkLosSYFZR87iKnHinfBZ/qmQdLkEBaO6FkQGDLNnMSEhFrgPAIYhYM5AhUKeJwZFWA==
X-Received: by 2002:a17:90b:2e45:b0:311:ea13:2e6a with SMTP id 98e67ed59e1d1-3124150cd29mr24182681a91.13.1748920819230;
        Mon, 02 Jun 2025 20:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMKoDoVhANJXhkEH8PMyc1LxUezj6sEzlWUU8w4Uyd+7t0SdHYB02l6iAUnHMY64ChUWPuoGBpUpLK5iNRSqc=
X-Received: by 2002:a17:90b:2e45:b0:311:ea13:2e6a with SMTP id
 98e67ed59e1d1-3124150cd29mr24182639a91.13.1748920818809; Mon, 02 Jun 2025
 20:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-rss-v12-0-95d8b348de91@daynix.com> <20250530-rss-v12-2-95d8b348de91@daynix.com>
In-Reply-To: <20250530-rss-v12-2-95d8b348de91@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 3 Jun 2025 11:20:06 +0800
X-Gm-Features: AX0GCFvi3ezIBQa7yKxnmidSOgr8eNk-oM266seJU5yCRwglxX_y22dfD-57w2A
Message-ID: <CACGkMEuwb+EcT=W5OwbZ=HOf=d56cZFKF5aYPx0iCLOZ630qNQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 02/10] net: flow_dissector: Export flow_keys_dissector_symmetric
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@dayni=
x.com> wrote:
>
> flow_keys_dissector_symmetric is useful to derive a symmetric hash
> and to know its source such as IPv4, IPv6, TCP, and UDP.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Lei Yang <leiyang@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

