Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1797254B02
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150388; cv=none; b=rFk6VqMtRfA5OBEWRM4zNV1bkxQ/yPY45beDvsG8WoOj1eUJCai66vFOtXT8XJPx540KfNtqkc2g4GKGckSyJYT9EmifNCkV9jt5VggWuDvaUXJhYoBdBZXzDQp5yGmLCxkP/P1U+3xivKsTOcyE3S4qN5ssFjFm7hQc6C7oAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150388; c=relaxed/simple;
	bh=7McDx3J4VkQZmMhLJBvqvNCoVb2tfviv30rZMGUZ9L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soamWJA5EKV8Lh0EkdxAvX1vVHskY4QHzHwd55+jpwaRB/d+iurEsc0iUkowClg40BHCtDvz1oWiZ7WSDzsueh3IW5EtqCpJetIXhhKnQwTufx+jDJqrvJREJHAYGdGMO37H3bd46EBIESqQleVhVpGzfLK7MBMawn5jkSU1YoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evilplan.org; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=fail (0-bit key) header.d=infradead.org header.i=@infradead.org header.b=gQRYFmIV reason="key not found in DNS"; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evilplan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=infradead.org header.i=@infradead.org header.b="gQRYFmIV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yo/kn8dNMg2O02h5sr9HArQO4+joqUT9u40lMRQT5e4=; b=gQRYFmIVAMIoDjc6hSQJch1bW3
	1Gc8bPamBPEkJP2hHBbW+BIollgBY3EtOs/QRJXX0RRF+Fv5dgRK9EzUHch373RXIh/TbhN3zA0nF
	ofusaNGeKpThuDclrenxvNrEtTP04TxFeUoMNx4UDUYIzoOYfVQkRRy/C8HKowqEFKVGp+uGXC69R
	+8yCF35np+qwxG2ySP3qSBZVOFajaOdHLYzdrp51Vegpykz6x1FO4EDccC45lBoTZDFKhPuZ8INYH
	CGcocfBYxPzZIBHLmkZEkHEMOOUWhsbc9sVVIYEdWTF7QVaC5dEDovulGiuZA749qeGnpb9IH5BF7
	WlJBgN3w==;
Received: from jlbec by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HBi-00000002ZLo-4Abq;
	Tue, 08 Apr 2025 22:12:59 +0000
Date: Tue, 8 Apr 2025 15:12:55 -0700
From: Joel Becker <jlbec@evilplan.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH 1/4] configfs: Delete semicolon from macro type_print()
 definition
Message-ID: <Z_WfZ0Mj6yVUI1tm@google.com>
Mail-Followup-To: Zijun Hu <zijun_hu@icloud.com>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
 <20250408-fix_configfs-v1-1-5a4c88805df7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-fix_configfs-v1-1-5a4c88805df7@quicinc.com>
X-Burt-Line: Trees are cool.
X-Red-Smith: Ninety feet between bases is perhaps as close as man has ever
 come to perfection.
Sender: Joel Becker <jlbec@ftp.linux.org.uk>

On Tue, Apr 08, 2025 at 09:26:07PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Macro type_print() definition ends with semicolon, so will cause
> the subsequent macro invocations end with two semicolons.
> 
> Fix by deleting the semicolon from the macro definition.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

Reviewed-by: Joel Becker <jlbec@evilplan.org>

> ---
>  fs/configfs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
> index 7d10278db30d667d0ef7e1140e54961c5a440c41..0a011bdad98c492227859ff328d61aeed2071e24 100644
> --- a/fs/configfs/dir.c
> +++ b/fs/configfs/dir.c
> @@ -970,7 +970,7 @@ static void configfs_dump_one(struct configfs_dirent *sd, int level)
>  {
>  	pr_info("%*s\"%s\":\n", level, " ", configfs_get_name(sd));
>  
> -#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", level, " ", #_type);
> +#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", level, " ", #_type)
>  	type_print(CONFIGFS_ROOT);
>  	type_print(CONFIGFS_DIR);
>  	type_print(CONFIGFS_ITEM_ATTR);
> 
> -- 
> 2.34.1
> 

-- 

"There are only two ways to live your life. One is as though nothing
 is a miracle. The other is as though everything is a miracle."
        - Albert Einstein

			http://www.jlbec.org/
			jlbec@evilplan.org
