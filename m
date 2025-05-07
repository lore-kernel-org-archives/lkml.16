Received: from out0-222.mail.aliyun.com (out0-222.mail.aliyun.com [140.205.0.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80C25EFB5;
	Wed,  7 May 2025 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620622; cv=none; b=ZN8XkobhLDbLMzRAg6Gk7kpJm/UbJpnNTbro5nP5k71o5kHFz5qkmJ3WCaovKAOs8F1aOPYuTexA/IgIeSojqs/sy1jmCBiZ5Ukb2o8lG9cPriGGdyH9cEkdwvDpQDAkjL17/Olyda2/Xu9huBlSWMpBag2QkSQfaZe+ZXILKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620622; c=relaxed/simple;
	bh=VX5Y48Mu89dzAbsuakWMa787AtgPl0MehdbZ14cTgOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jY4aKo/rEgtSEsgaGNQGY86WEnZBvPikBavyb7OjanWdx3aeHXo1u54LvNvDLxJMeul5sHloAz1uFBHeA5x3Qr1AfbwA2TSMcwCKueDSqsZr3x5zy+WZaxra/a8FiGHxfvKBLMQK8xXi75fwX7StrawQ+vigPKCoq52cHOV8aJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=k1mjTvSd; arc=none smtp.client-ip=140.205.0.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="k1mjTvSd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1746620614; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IdnAOnCRq90p308A+UdFioQ4SgHht6IUlP0dVVbjW0U=;
	b=k1mjTvSdiRQGabCLqY7DpLN5zgkv6lLVGusybQBx+fpKILtndgW9FSH5RP9GjQM5pX6si+isSq/nGcq8CSFxhIEmpsdd6XuhapjuIGcOsPKjfWBzafeQtr3edTmeW8u/ngnn9bgSHJoyFtLbiuI1IOxzT92swYhqXvVHhy8HZbI=
Received: from 30.174.106.64(mailfrom:tiwei.btw@antgroup.com fp:SMTPD_---.cgyj98E_1746618744 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 19:52:35 +0800
Message-ID: <2ac70b02-7841-4355-ae71-5b57a6ce15e2@antgroup.com>
Date: Wed, 07 May 2025 19:52:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove obsolete file entry in TUN/TAP DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250507071004.35120-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
In-Reply-To: <20250507071004.35120-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/5/7 15:10, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 65eaac591b75 ("um: Remove obsolete legacy network transports")
> removes the directory arch/um/os-Linux/drivers/, but misses to remove the
> file entry in TUN/TAP DRIVER referring to that directory.
> 
> Remove this obsolete file entry. While at it, put the section name in
> capital letters.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9c166503cc6b..34a55e3ff863 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24981,13 +24981,12 @@ L:	linux-parisc@vger.kernel.org
>  S:	Orphan
>  F:	drivers/net/ethernet/dec/tulip/
>  
> -TUN/TAP driver
> +TUN/TAP DRIVER
>  M:	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
>  M:	Jason Wang <jasowang@redhat.com>
>  S:	Maintained
>  W:	http://vtun.sourceforge.net/tun
>  F:	Documentation/networking/tuntap.rst
> -F:	arch/um/os-Linux/drivers/
>  F:	drivers/net/tap.c
>  F:	drivers/net/tun*
>  

I missed that. Thanks for the fix!

Reviewed-by: Tiwei Bie <tiwei.btw@antgroup.com>

Regards,
Tiwei
