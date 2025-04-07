Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6961CAA64
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035434; cv=none; b=jw4Ef+p7dayAyrO3McQPCEgoo3Kg2wqUrMSvpZeWsQwzEyxhK4wv+MWWpTB8HX95lOgOMaMpGs3CyTRNSJNYQhAoYl4Q1UvHKKLfToA1jXSfBP/mN4ek/byOz0WCYSGlfX9lCRYiPlFTdzan8xLkPv1izwsXk9CSd1JwjG2nPcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035434; c=relaxed/simple;
	bh=u7xBi8y8quGJVDkuhH0qHYxgViZkg+uXeLe/8fr0ctU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=JjJ4qNWhpSUsOIlHxXNvTVhPK3E4mcnfW0GPo2xueG5z/w4o2IDQlC7lphITHMDECWt6ndyIv3p4E3Y7eHH1WwAT0IRKxPYZRgR7Y57F0w/y9AhWgJq9c9mhnXKqxtolUID3pBtGRWiR3NslfhixexxfdNAM1xavKqL7x1TO/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d443811f04so41992385ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035432; x=1744640232;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uaNP5LiQosFTE3+99qu/GfFM+fsc9WqdSZxMpRvfLk=;
        b=ksGbAxmlb5loi9++/Nfgtxc1MwaDull8Hn3/Dnqpdasp0urNOYoHKvpxF9qjUqrG6e
         1oIVALamSVLgY4jcC1iC85e0anH/xbyXlVEQN+9esczABtf8LeofH5GFh1oGwxNNq/jp
         E/lChbqiKAvIHKmHnJfbTkrPoW3cwJhIg591xqA2+9HibbJ0FPdtGuseZuBrpzYsGYLi
         nD4ebnBGL8CJi6Ewoc3MLvvy1NJWToJzl5XKlTLiyAIzDRIOK6Q8zfB6tIjAUbc62g8E
         3/DrHnWS3+fAR1y+pYFUF3UH5UxkkCSNuMR5FzPEetKT4CFSCHZn0YJ/Re8R+WJkWoRE
         zWAw==
X-Forwarded-Encrypted: i=1; AJvYcCXTrIkBZ2d+WXF0euqdxrY/MlhGN925LC8RN7Vn8Paf8tDuaGFPH326a4OwPHPXA+QhBL9ncgosrxk0KGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNPXtiJlXRbkZB1n7pyqRxAyIC6H5kBDC4j9gwasp6MSDtX/wB
	j0LOhXrvKzFHgIIP7QPqxM/l2/si55IwVmcfLS4xU3b6uBPTFL8Ec3dPkG6Uxx3MdXob12MHmgm
	1TU8hJOxNzS2dRNG00pNmVpJUq8aYBa/HwxH1aPRSypIT7l/wIm7S3ik=
X-Google-Smtp-Source: AGHT+IE4CIzkVeo6NDC8dq8GCEK3Bm8+KBaaoCschs0czWHzY8PZIOmO1Z5AnKypOkUFkYMIyeOFb/wYjaRSjp0Bia06IV0yyJEQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:10b0:3d4:6ff4:261e with SMTP id
 e9e14a558f8ab-3d6e3e67eacmr87122795ab.0.1744035432461; Mon, 07 Apr 2025
 07:17:12 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:17:12 -0700
In-Reply-To: <20250407141705.92770-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3de68.050a0220.396535.054f.GAE@google.com>
Subject: Re: [syzbot]
From: syzbot <syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com
Cc: andrew@lunn.ch, contact@arnaud-lcm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Author: contact@arnaud-lcm.com
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

want either no args or 2 args (repo, branch), got 5

>
> diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
> index 644e99fc3623..520d895acc60 100644
> --- a/drivers/net/ppp/ppp_synctty.c
> +++ b/drivers/net/ppp/ppp_synctty.c
> @@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
>  	unsigned char *data;
>  	int islcp;
>  
> +	/* Ensure we can safely access protocol field and LCP code */
> +	if (!skb || !pskb_may_pull(skb, 3)) {
> +		kfree_skb(skb);
> +		return NULL;
> +	}
>  	data  = skb->data;
>  	proto = get_unaligned_be16(data);
