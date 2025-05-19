Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2A1A0B08
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636599; cv=none; b=dHF+PbA/2b9EDag/Fn/FVBsBXmPL1Jl9DJZKesS3Od9RRpk4dw6gSZ8E+9lsGuMtT05VX/k6nv6CPPMJfdjkkHNEIicMPDpZYNZJX65WLql1R6tJrg3AXDc6/J9BUVq+98IbIM6bjnydV7Nxd/Z+lxoLOaHbBca7oawauV3UOlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636599; c=relaxed/simple;
	bh=lwqWQzzD1KaZNdyW32w2LLw5wm1gpthvv/BW6duSbJs=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=dIx2narqyYM9y51bSaxDWVDqoV7irpoDBr1iiEhr44ZXm3xWq3zLc3Pab+v+HG4tVkMgWdVFk7sKF2iZMhAm413oOMFUkzByoM4OgfzsfOkfVGfK3y1UKLV7bg+DUobTsx7xgoXgPLZiZ8iL7gDAv6C7hnQkh6B1QTmHSm5Pp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b17Hx0dSBz51SZC;
	Mon, 19 May 2025 14:36:29 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 54J6aGEc052329;
	Mon, 19 May 2025 14:36:16 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 19 May 2025 14:36:18 +0800 (CST)
Date: Mon, 19 May 2025 14:36:18 +0800 (CST)
X-Zmail-TransId: 2afc682ad162ffffffff839-45cc2
X-Mailer: Zmail v1.0
Message-ID: <202505191436188855ReOYCghNWSoD1i2A4r9h@zte.com.cn>
In-Reply-To: <20250519141446635ihK4D1-JvptKANb816_Kz@zte.com.cn>
References: 20250519141446635ihK4D1-JvptKANb816_Kz@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <jiang.kun2@zte.com.cn>, <wang.yaxin@zte.com.cn>
Cc: <yang.yang29@zte.com.cn>, <bbonev@devuan.org>,
        <linux-kernel@vger.kernel.org>, <bsingharora@gmail.com>,
        <jiang.kun2@zte.com.cn>, <akpm@linux-foundation.org>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0XSB0YXNrc3RhdDogYWRkIGV4cGxhaW4gYWJvdXQgeHh4X2RlbGF5X21pbi9tYXggYW5kIGFkanVzdAogaW5kZW50YXRpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54J6aGEc052329
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682AD16D.000/4b17Hx0dSBz51SZC

> add explain about xxx_delay_min/max and adjust indentation.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---
>  include/uapi/linux/taskstats.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
> index d71aa022b2ef..62e2d7f65298 100644
> --- a/include/uapi/linux/taskstats.h
> +++ b/include/uapi/linux/taskstats.h
> @@ -207,6 +207,12 @@ struct taskstats {
>  	/* v15: add Delay max and Delay min */
> 
>  	/* v16: move Delay max and Delay min to the end of taskstat */
> +	/*
> +	 *
> +	 * xxx_delay_max is the max number of delay values recorded
> +	 * xxx_delay_min is the min number of delay values recorded
> +	 *
> +	 */

The naming of these variables is sufficiently clear and self-explanatory, so no need to add these comments.

> @@ -225,11 +231,11 @@ struct taskstats {
>  	__u64	compact_delay_max;
>  	__u64	compact_delay_min;
> 
> -	__u64    wpcopy_delay_max;
> -	__u64    wpcopy_delay_min;
> +	__u64	wpcopy_delay_max;
> +	__u64	wpcopy_delay_min;
> 
> -	__u64    irq_delay_max;
> -	__u64    irq_delay_min;
> +	__u64	irq_delay_max;
> +	__u64	irq_delay_min;
>  };

this change is ok.
