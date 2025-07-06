Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086FF2AE90;
	Sun,  6 Jul 2025 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807822; cv=none; b=kE8fo+mOHAlz+sarvtC51DhpNx8bGeIz+/rROnqvf4J57xvJTcXvSxLCKwDW1XXIfHYfurOQ23vgQjH4tdZr4rjg3SILP+VyQiJxqAF31QpLO5tIul7M0hk3oqjquRN60waGpW1qep/TySAa+LYDohqKUnyZdOlnV5XI7ep5F3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807822; c=relaxed/simple;
	bh=HuNTV6cW/+vs+mGK9vS2XhW5GQHCu+ctRZXx7qK9VRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSEKMNfV9mGtIh6KY8sRz8ASEPYz1i5ghO0eY5chbOdPar5p1YELLqz28F48cq7s7cYWDs31gb39YykSsh1ambM4mf9V0tL4EXJnbpQPkUWzebB4/5TB94YqOcyhK76LKw51fKoj7n0CicFqpvbrXrDEZCT2CDik9SmV8IsST+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXwu21Ro; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXwu21Ro"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so3494444a12.3;
        Sun, 06 Jul 2025 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751807818; x=1752412618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuNTV6cW/+vs+mGK9vS2XhW5GQHCu+ctRZXx7qK9VRQ=;
        b=GXwu21RoNKaxKLdQO4a6VDJfsXmzl4FFNIiUIz8OM2pT/PRUaEEXkYg7Rynd4yDoO/
         jZQ6qfistqPpYhOW7PRzLK+ontGtPb7oHZd5AH0/0jLoY4C1ZvxuFavufkK+N6drJ8mc
         GMXn7e3GmCkC55nGscK67i28n+RbD43MaxluUdaLcRolf7/2X+IAxgr9NLASQZTyXv6H
         Q3YzBD4bSs6L4nhmM+cdnWlkFSK3RPBDrgwitkTGn7UB8FhRu8Tkt7ywEXlk1uUfFcDg
         VjbzWeaHClrvDcACkpvTOtyMRu6En7MrDCOnyvggi+I1QjGmZkHtkBTsHc7WL25btAm/
         4Nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807818; x=1752412618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuNTV6cW/+vs+mGK9vS2XhW5GQHCu+ctRZXx7qK9VRQ=;
        b=GS8ZtmH2FCd+/QI/8lVn4HKzr9PbYgShrj36m7L1f0Hy4TMMvsSGWrIhyxY6QeZY/Q
         ecBEV1krFi1coJFoTZYuu8j+qSeuOPPANoCDxRRLaqGM5aaGkh72fXGJt4sHWNrkMP8M
         ZEdBkJRLPZbg1f0k0G1nanQJ4geacx9Vycx2VXGF/RvHLwlQdV4K/FQVYYz7+svs/bag
         oCYoIOZzh4yw2hoOk3KUvQN8TKnIeVBE1LJxCbV4tqQqoYxmMvL+WvRwwLTkvSkLk8H1
         C4EavB3CKiq3SDsEx2z7mvYvOXdOoTw8F54i10wCj99QDawAqji1OS+eW6bs5A27Ys3r
         QwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbMAnSO39LkQgWRPfCCXuWKtBHjldgCK+GXO1RBW97fm1Vw17Q9RG1zbLg0eRjfW3HmRA+yNudpALS+ec9@vger.kernel.org, AJvYcCWCnGXOWEGVbQ57+Wmgc2iUScziew71WeLVbfeX9h52uTCCa35w3bniI1i5UrO3KI3LO5Fn/aCQePA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1gOBL5sUAqyT0gyqxBKy88qGjs8EXPplE6btYFfYPvK4PyG6
	IFb9h97wF9fVeKMfRyHRK4+TiKX6zF129bW/M6r3klvFPebNltHtkkabUyAL05StDQQfwIDGVIr
	mO0lBHsYXw/fh6Cyg1rbR1l3uWvz8BlA=
X-Gm-Gg: ASbGncu9r/+GmLpx4Xn36RcxYhYo6tXs9vHdn2YZPkXNqWYlVFhMb7P9BGMVuFOLXym
	BTh4jYiN0dKjzz8jzEZUW+GDgY+DOuGp6BbHfkHZT2GsmTcepvpnR04+gr3P1UHSX2RkVAEawCP
	DvHDIXb7uZMQoVvsJzi1uPNtAiscAHJ5R2HWGjwOSQ1Z0=
X-Google-Smtp-Source: AGHT+IHWdD0p4xg8rqozaCpj3xPvV3G94fAeBkyHoePx4D3lExuJ+9PhcbeUGiUwDGxwATkHI6CD4WvBTgK2K1/hGIA=
X-Received: by 2002:a05:6402:3593:b0:607:f31f:26de with SMTP id
 4fb4d7f45d1cf-60fd64e67d3mr6692015a12.1.1751807817911; Sun, 06 Jul 2025
 06:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627143212435mZ2WRnqC77Y-XxvFKrGsy@zte.com.cn> <20250628121917249q9r3rXmnBmRqbgFtJuDHW@zte.com.cn>
In-Reply-To: <20250628121917249q9r3rXmnBmRqbgFtJuDHW@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Sun, 6 Jul 2025 21:16:21 +0800
X-Gm-Features: Ac12FXyNf_lFxYfvlXz5vSS7j9O7XXUMDJickxC6-r5Wf8vDoYGiJoGiyVmZ0wE
Message-ID: <CAJy-Ammd++oK+fe2WdqXS-qvHozPmnGVc8tTqfS+fvnqzpr0oQ@mail.gmail.com>
Subject: Re: [PATCH v2] Docs/zh_CN: Translate alias.rst to Simplified Chinese
To: xu.xin16@zte.com.cn
Cc: jiang.kun2@zte.com.cn, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn, fan.yu9@zte.com.cn, 
	qiu.yutan@zte.com.cn, wang.yaxin@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch applied with merge conflict fixed.
Thanks

<xu.xin16@zte.com.cn> =E4=BA=8E2025=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=91=A8=
=E5=85=AD 12:19=E5=86=99=E9=81=93=EF=BC=9A
>
> > From: Qiu Yutan <qiu.yutan@zte.com.cn>
> >
> > translate the "alias.rst" into Simplified Chinese
> >
> > Update to commit 735dadf894f0("docs: networking:
> > Convert alias.txt to rst")
> >
> > Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
> > Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> > ---
>
> Reviewed-by: xu xin <xu.xin16@zte.com.cn>
