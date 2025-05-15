Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA8222586
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308776; cv=none; b=rTcbyWiVkeHYZZCURt8nXuD6ncBc+jfwB+3QNu+AKnkFHI4psgNXq/9I3paXLBDZDVLbZ1fu81WV70Qvb5QIZY5GYI2wZoEvqI/DAVb0fbB48xqNTwOtAbhuXWRPL5I20bBTaxEBGZM6W5yEUXbEDakAYigp5Vyrm9hLe+WYK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308776; c=relaxed/simple;
	bh=ElMXO/T4zoIZ2d20Nku5GnZ9Mq/F6htR0kFRYtgorvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgaiz2syo7V2R8KGUeqZ/YA26BWLhwoi0ZS7wGS0tO8EMPE3n7we7mTjOGcpFaHZnIwzqBSBo9azgjZXSgQC2YEAF8nOsykNg1y+hPQGi/4Kc2F6gFlgL8j5xo9IclJrY03FdG9+e7ssUCVRdRYrgybGj4UaK+OoiSBjmfyBI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=gDF++vmu; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="gDF++vmu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sl3OIA3EmpqLMK5V9bpgYMX6d1risB6uqFtthLMl3Dg=; b=gDF++vmufHR3B8efx5NA0vNLgK
	Ta86v/7ubqhgEHWMUW55ReBSywF23BEAdjOapC58G6dUEAnfeqIagBS99bUNliAEZBzQp1UbVysvh
	PWXFQj/ofGad53iKlzCGWZeTsKZzS7AOtqX8JB+hY1ekbEzaTpRatSbnpXt4QSgByJzWjezQHiyqX
	9CV/pIOu+duMd1hU6W0phdw6W6ZL6wCbq5QjNNPOxWLCEV6MltwFhXQIHwkwfxo7NxzEenAmNkX0H
	f3ttCp4vxsqGQFPyWDVEaWn7A0LifY7HfoacknfmEE/mQsKYwYnlfsUcp2J+G2fRxfoNiszYc6fTP
	EwVPyUNg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1uFWpL-004VlC-MN;
	Thu, 15 May 2025 13:32:40 +0200
Date: Thu, 15 May 2025 13:32:35 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Wen Yang <wen.yang@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install: fix a false positive
Message-ID: <20250515-magpie-of-ideal-pluck-c6e323@bergen>
References: <20250513160056.7576-1-wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513160056.7576-1-wen.yang@linux.dev>

On Wed, May 14, 2025 at 12:00:56AM +0800, Wen Yang wrote:
> The current implementation only handles C89 style comments (/*... */) in
> the code, and there are false positives for C99 style comments (//...).
> 
> This patch fixes this issue.
> 
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
>  scripts/headers_install.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 6bbccb43f7e7..41722bcc8668 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -44,6 +44,7 @@ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
>  # Remove /* ... */ style comments, and find CONFIG_ references in code
>  configs=$(sed -e '
>  :comment
> +	s://.*::
>  	s:/\*[^*][^*]*:/*:
>  	s:/\*\*\**\([^/]\):/*\1:
>  	t comment
> -- 
> 2.25.1

thanks.  The patch looks good to me, but I cannot find any false
positives.  Have you found any concrete?

Kind regards,
Nicolas
