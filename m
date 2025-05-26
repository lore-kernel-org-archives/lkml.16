Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751716D9BF
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248569; cv=none; b=JWEYqiH6PDltDdvxN5JyYPq/iDR9MtVwGpUFu/AE3dUHdkX3A2VKUhUmXm4DPqTKygl7W9th6+4XgP0JLBPcm/3wWkxIHWQLvQB8q+Z7rcs78nSiVwiC0FO9FrA2O3Ay2lXibazT4UKZHZArXHzE89TU06OjhXt+/DOljlhet7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248569; c=relaxed/simple;
	bh=H6FPcoapW6LYs4/tFMczeQLKOwQR2d+yuZp7FWr7mXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMIejtVjnQ35+rGrHj6kl2N3Sy1iNPn7m2lbhwP1cQCn9khVItdRObq/mHeO5N7EAz+yqbCrUS9sZJ7I9dd4iVQHjmmQcMw120pAt/SG1NndFtQ82LuEkltAhW5+WHTxnu+jzxTqJTEynUk7GwkutM4dV/9LMkcYyRfLaurMbIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lx44D2H9; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lx44D2H9"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c54b651310so274779185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748248567; x=1748853367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6FPcoapW6LYs4/tFMczeQLKOwQR2d+yuZp7FWr7mXM=;
        b=Lx44D2H9bleXsznA+xHzyW5XZasHF5bR/HGTZGNGrCXzKH9FVql5fx8FbCDP9yTgNn
         ASjM5PNg8cR5bH8mClbQsy4g9Vy8yRElXLQ7TrFL97QeeM3X+rYQNehbAutCtWJgramz
         9GA+fVSNda5UjezoPAa04mKlRRYDbtbxQEPQGiB+SZppboem/mNrplWcikMelj4VkWk7
         s/9MqBi/G5Nu6x+qH8pYGYXUIt6rnuS0B4Kf98O4r9p5fPnpS3qRaaTE3OYqKo8/LZ5A
         xuViGtO3KewxdiCnhLZjQybb7Y3FXkibO0lsCYeJ6/w75HDVBnohHQl4yejKK5AbqIpQ
         k5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248567; x=1748853367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6FPcoapW6LYs4/tFMczeQLKOwQR2d+yuZp7FWr7mXM=;
        b=q/XAG43Vt8I4FzUtRoetnK83N0qZPH7kwx52weiPPeWx8AsnsgNZ8JaH28D+2RyiEZ
         gTaDILD75a3pWCn+4tBNe1vwWdAKJ+jtAmnI9CKxieI1/TJLioNHujzahqnTkNxtL1t6
         NhjeBNQD/dPHO/sJp5BFYhOFJyZ0m44sUXqKkuISn/6PQ6GH/4lPUYFzwQy91IafNwhk
         40bbPsIuSPSkDq8RCos25lBp05VnvV/8j34opF75qaIFPs2jGmLbL5sNXDjw8qSo32+3
         rqg1arN0JajOF28QzRW+cocONhyrBZsMPmnDHOQjr/717Q/IP2D6Bp1L0iRrtLQ8PW9N
         gwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDMvpBFoT1WTNzzSfFozM84naxj4lvE3tannvr6lsUTW07xG1JiJz6Zd8hDhM3NDP7MShz2cPjrz5vghs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8CgNFPvsekVCyK3VeNqWqX9obgnpaVm58JhrHx1Yys36xJkEc
	xnfSNgI+VJW+q5wDfbyOLhOzI2UTJ9L6rz6w5VCzjRZWtqs0XbZqdKTN8zlv1u6LCPLYV9pb2cx
	J5sX40tkJMHAcCz0amIorfea58GgqAJ+2zRn4TX1W
X-Gm-Gg: ASbGncs4K6GKUnzbxU1MDvaN693tlfMw5IZt/e6M2KH9aEEeg44TG0mH9/nOMvZYaSm
	+gAL3NSJIeATH/IDH058CeZq+1EdVK/Xo1ymZ2zEHjZlhAcV4qVguzw+x0kQ03rXHK431d4hy+j
	0KApzLwPmSvQSr0op+Om97LxNZDglMDZMIF0C75agFQV4=
X-Google-Smtp-Source: AGHT+IH+lATwixyjLk35ENMR/lLPgqnbc0dVWnWlHBmauENi5wzi1s/nKvmOjob9jJmbN2aEHHf1Cbx9zC3cjnzWKgc=
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id
 af79cd13be357-7ceecc166b2mr1460320685a.41.1748248566970; Mon, 26 May 2025
 01:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526162746319JPXpL0xRJ-n7onnZApOiV@zte.com.cn>
In-Reply-To: <20250526162746319JPXpL0xRJ-n7onnZApOiV@zte.com.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 26 May 2025 01:35:55 -0700
X-Gm-Features: AX0GCFu_RjaFJ93BxZ0dibD3-EVHEhcimUXEfSJZRfc8I1_0AdtDtbR4NXdtp0M
Message-ID: <CANn89i+C-qk-WhEanMS_tRiYJHHixH33MAO3u-wQVdWGJOjskw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: arp: use kfree_skb_reason() in arp_rcv()
To: jiang.kun2@zte.com.cn
Cc: davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, 
	wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn, 
	tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn, 
	ye.xingchen@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:27=E2=80=AFAM <jiang.kun2@zte.com.cn> wrote:
>
> From: Qiu Yutan <qiu.yutan@zte.com.cn>
>
> Replace kfree_skb() with kfree_skb_reason() in arp_rcv(). Following
> new skb drop reasons are introduced for arp:
>
> /* ARP header hardware address length mismatch */
> SKB_DROP_REASON_ARP_HLEN_MISMATCH
> /* ARP header protocol addresslength is invalid */
> SKB_DROP_REASON_ARP_PLEN_INVALID

Are these errors common enough to get dedicated drop reasons ? Most
stacks have implemented ARP more than 20 years ago.

I think that for rare events like this, the standard call graph should
be plenty enough. (perf record -ag -e skb:kfree_skb)

Otherwise we will get 1000 drop reasons, and the profusion of names
makes them useless.
