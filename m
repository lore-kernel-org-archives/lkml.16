Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D68BEC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614329; cv=none; b=pZlM+tUCo+4TP/1CeD85kc2X01lSc2JBocOYInCC3CC/TzLedARxGZSTUFmpdusQfiN00ivbqBceAkk1OnG87Zll0O9ACnK9E20oZ+2CNNRx6CXf+Y7kZapwR2PIqa1fyoFvGXlpizyz+6AKwF4ggUeg66TOLs1ac8WlrPsK/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614329; c=relaxed/simple;
	bh=LFGH4G8URc3usfSiHyKn3cdRJqfpMIrM0YqzvbRMj4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGjoop5AHMmx49qGKC/Uis9dNKUMTAAQEuMKyUVb9BiPZmK5QRr6JbnM286X3UFw9nMffI3IkqIurTAtjrrDQ2L0g7gWm/N2f544ki4X7rvOL3nJm9E6osreEtTHsUQG0O1q9kkMerdxWy8GIWJj2uCtDnQW2oSBcsgICL1CTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3NXFZWZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3NXFZWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A17C4CEEA;
	Mon, 14 Apr 2025 07:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744614328;
	bh=LFGH4G8URc3usfSiHyKn3cdRJqfpMIrM0YqzvbRMj4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3NXFZWZpbCMnUkMgJZv23DlHjwT+JxinguU6VMT9IZSO6/6a0YMReH4ST7K0hRbi
	 tEMcnt2VqRvp9phnhc0zZwgaLg6UTye6+xL7qcTGV1/Chz1ipQsUj5hnR9sGH3RMbE
	 Emd/1WG0apr3cH6PqumzS2Vh3qlMBimfGW09IhsBMhXkBOcJSG0N//t8pIjk+Bngzk
	 ssR0J+h188qkgInypYw9mEo8j6Lteu22WvHn3Q1iJRk2tR2t9mk+Zj8KpAvxBa8m6l
	 n5DfQ2OkOo7M9PLFxm+xJBE4cqqjeEN4MSZhUyjI9aKuvya/kuzeqOTLR/O0z9D3Go
	 jex4KUCvR2oYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Dsi-000000001N8-31fv;
	Mon, 14 Apr 2025 09:05:24 +0200
Date: Mon, 14 Apr 2025 09:05:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Reformat code in
 gb_operation_sync_timeout()
Message-ID: <Z_yztGweLAfJgwXh@hovoldconsulting.com>
References: <20250413104802.49360-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413104802.49360-2-thorsten.blum@linux.dev>

On Sun, Apr 13, 2025 at 12:48:03PM +0200, Thorsten Blum wrote:
> Remove any unnecessary curly braces and combine 'else' and 'if' to an
> 'else if' to improve the code's readability and reduce indentation.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/greybus/operation.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 8459e9bc0749..ba26504ccac3 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1157,16 +1157,12 @@ int gb_operation_sync_timeout(struct gb_connection *connection, int type,
>  		memcpy(operation->request->payload, request, request_size);
>  
>  	ret = gb_operation_request_send_sync_timeout(operation, timeout);
> -	if (ret) {
> +	if (ret)
>  		dev_err(&connection->hd->dev,
>  			"%s: synchronous operation id 0x%04x of type 0x%02x failed: %d\n",
>  			connection->name, operation->id, type, ret);
> -	} else {
> -		if (response_size) {
> -			memcpy(response, operation->response->payload,
> -			       response_size);
> -		}
> -	}
> +	else if (response_size)
> +		memcpy(response, operation->response->payload, response_size);

NAK

This just makes the code *less* readable.

Johan
