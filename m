Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D93A32
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744683516; cv=none; b=ftEaPf2aGzHQmSMeAoJ25KnYI7LmpIK9Kt3zCxwXcx6jPlBqRVUWWtJImNP1FS6/OiCzCJkjc+HS1w7pJ1aP0lJ8tg8FQwuAhNR5C2XSDHRpQhWZozxAoP6bI8z0amvgrXeKUxwhsVkRhUxrj4rgmfmL/Fy1XmjPO26P55NyhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744683516; c=relaxed/simple;
	bh=thOPuvLIQzgv7to5Bo3IVi6FkYgZ8CRe10HyczY2goc=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=nJKKh2H1pysPmQJk7OcXiNqisSqzjL67CxaiHpqthhUQWuASzf173mUetbF0sz1ynTVWnsIyBZWhWDHlFm+DOEkDB/sAJajL8AfLb/lvsHqY8ny46jvoFJG6oAvv6FqIxwSgAKLu1QXBYKxsjtf+3qa53Xq3a5odAVFDm8VcHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas5t1744683425t915t24530
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [36.20.107.143])
X-QQ-SSF:0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 3094269659863382227
To: "'Abdun Nihaal'" <abdun.nihaal@gmail.com>
Cc: <Markus.Elfring@web.de>,
	<mengyuanlou@net-swift.com>,
	<andrew+netdev@lunn.ch>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<saikrishnag@marvell.com>,
	<przemyslaw.kitszel@intel.com>,
	<ecree.xilinx@gmail.com>,
	<netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20250412154927.25908-1-abdun.nihaal@gmail.com>
In-Reply-To: <20250412154927.25908-1-abdun.nihaal@gmail.com>
Subject: RE: [PATCH v2 net] net: ngbe: fix memory leak in ngbe_probe() error path
Date: Tue, 15 Apr 2025 10:17:04 +0800
Message-ID: <00b401dbadac$7b36f120$71a4d360$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGCg9mRcHVPncQlJ+6fjxtFMDYEpbRWUAdQ
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: McFs54YitxxBBAiVtOSbXOoLUYu+Q1dG+CjLfjJM76F5BvehNHQWD4W/
	pvCukRuSVEXaF5GPaFDyrIPPP/FOoZd1DFj8xaGJyZCgh0ajooRPgO9NDEwoW0SWqS/bHGp
	D+G9RyIFELnrV+L063oKSihBgcJ3T6YOUK3GeufjWIclT2KE6l75DVdCd4i6/7DZJHbUMU5
	HIKpUlbs1RHXYL7Zu4yVf0b2MbtmfeiVD/vt0H5Ce6kgD+mS6X9ZmuQYrAOMeJdAZgqfgy6
	QXh4eEYwhQo5ID5d/2+nSmKKVsLsnsAago0kv8AYTapUVtjN9Z2jv5udXEdGJeVYVESL588
	/FBNUdV3SMBqjhWiSaH0T4pQ/BSQTKGanXJURmNkG8KAgwYlJLe8OVRRyuEHRbNrpMLTeHo
	vHelDKzrDwsgqDjmXLTO2y7rLCcCKw+aJb1YRgaLI5Lw/IVbb4gEkoK2hrsY068z+EJuscU
	OgH2Zvv9kjSIy40BVxp/aLooPhkFHDuxYiF9IM5BmhiMtvTALAUMHTdcO6WC1K6ps4l2fWB
	H7h1XG3Zu6CPZgILFR9nK0gDeUps2UumZHQyGLGkDak3Z7xkMN0/xMewY/VtoWsk6VBZ3RM
	3fqdjcGSn7oPFiAWcd60Zf5Kd/ZA/+ss/d1gDx0oBqcPfs6Xb9dTNDv3wBa1rf9NoNo+RQA
	9hR7o3mG0y9BQ/69Ke5xNAx0No+bZ8sQXhHIwnILrQLLEzUTzq3zNSXQYWBNfkydss5YWTF
	/G54KIrZiXzYm51SfNCfMZuQTBr9i5i29nlfSHkwpKrjn6W4sDMWvh4g+bBLMIM8fmWwx11
	W3b1F+UbJlK3CF/DuwvH/J2jT6sNyIOHX4pj6k+rWYW5Yd7JEZCgSL6ruI/ezWX+XPnn8IK
	fmx/TCnVGnCpqJe8492Rs7ZHlIIUxx74TgMIPBxZw48fc6Dc+gUYjSWBxbwYQSFnTPNlC8Q
	ZfMijR/TWQoaw8SGMLQXRKRq84KvztSA+kMoHmLz4ObEmbcteexTpitAYp+XRoITTVYdf6v
	T/4OhUaiQXUYJSXR948loxYBhiRyyknuauT3GZAA==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Sat, Apr 12, 2025 11:49 PM, Abdun Nihaal wrote:
> When ngbe_sw_init() is called, memory is allocated for wx->rss_key
> in wx_init_rss_key(). However, in ngbe_probe() function, the subsequent
> error paths after ngbe_sw_init() don't free the rss_key. Fix that by
> freeing it in error path along with wx->mac_table.
> 
> Also change the label to which execution jumps when ngbe_sw_init()
> fails, because otherwise, it could lead to a double free for rss_key,
> when the mac_table allocation fails in wx_sw_init().
> 
> Fixes: 02338c484ab6 ("net: ngbe: Initialize sw info and register netdev")
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
> v1 -> v2:
> - Add fixes tag, as suggested by Markus and Jakub.
> - Also set the branch target as net instead of net-next as it is a fix
> 
> v1 link: https://lore.kernel.org/all/20250409053804.47855-1-abdun.nihaal@gmail.com
> 
>  drivers/net/ethernet/wangxun/ngbe/ngbe_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c b/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
> index a6159214ec0a..91b3055a5a9f 100644
> --- a/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
> +++ b/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
> @@ -625,7 +625,7 @@ static int ngbe_probe(struct pci_dev *pdev,
>  	/* setup the private structure */
>  	err = ngbe_sw_init(wx);
>  	if (err)
> -		goto err_free_mac_table;
> +		goto err_pci_release_regions;
> 
>  	/* check if flash load is done after hw power up */
>  	err = wx_check_flash_load(wx, NGBE_SPI_ILDR_STATUS_PERST);
> @@ -719,6 +719,7 @@ static int ngbe_probe(struct pci_dev *pdev,
>  err_clear_interrupt_scheme:
>  	wx_clear_interrupt_scheme(wx);
>  err_free_mac_table:
> +	kfree(wx->rss_key);
>  	kfree(wx->mac_table);
>  err_pci_release_regions:
>  	pci_release_selected_regions(pdev,
> --
> 2.47.2
> 

Reviewed-by: Jiawen Wu <jiawenwu@trustnetic.com>

Thanks Abdun,
I think this release bug is also present in txgbe driver.
 

