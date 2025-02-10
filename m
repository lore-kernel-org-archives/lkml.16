Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB65223323;
	Mon, 10 Feb 2025 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190749; cv=none; b=FT2+L5iJmBJoOmu3JaVUOe1oWN702sZBwGIzEO1l20fqkkqiWYhFeWz3HakbloXbrflObcFPd5imovBCbg9u4XMtRumMbqnj9lfoj6V0tDFNbGcfySTizhp9HJhvu+cEtwt0ScZha8Y47V1I8NBycX3pIAKjnX1pP2A/YzSVOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190749; c=relaxed/simple;
	bh=Jts80uB/oAtAZwBZ4eDRdhcESqZ1GrFBWXUjt1xyOlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onRTUINYo4gDko8bzpVMILQbU6caDg+Ct7Az9L26N+Ab/XvRNiKoOY1SSC9+tdhcDvFeNMM4AXnQ1qjt0blkWQXJvTMsP847dKqlDSwgtUPEJb9ysp4IyA8YzcrpjmkAdhMNV8aAdOo4/WNdQYmwMkTNBru303YbVocDRQPLKJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=uldDhy9P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sei6QLGa; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="uldDhy9P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sei6QLGa"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D8AB41380632;
	Mon, 10 Feb 2025 07:32:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 10 Feb 2025 07:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739190745; x=1739277145; bh=IpFTdBJc1O
	41rKqs8Xyb0uHiQGbDsr6yvQcsoCSODrw=; b=uldDhy9PqXqZZUsIpoBNbtmnKy
	Ms9C4m8GS6A0yfJI79g1+yF3kD3LwNo8wy4X7zDGo0J4C5tcRug6ORdKBC88cpOa
	4Asyf5n7YI8EieJVkC/3BMVmqSJshfYNVEV6RW7v6bZKF+S9J0pa8fRa8PCM+GsA
	kWb7/BU9xOPrVlbyMntQuPTAW8vXXotH91gEgxKdOxDAdPktsYgSV/5yprjlLkm+
	nLN39wj0iyVKDV5HGcPeHCeQLSG2IlAGmMIFgBNJ65Nwi045M05D00PKCLCgVZDP
	OZwt3LkpZzsa2gSnkEdhWTcqrpylNKFjga1D3Y92TKIFpiHwssWEkZpLez3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739190745; x=1739277145; bh=IpFTdBJc1O41rKqs8Xyb0uHiQGbDsr6yvQc
	soCSODrw=; b=Sei6QLGaBOgMOVvamBPgbrHkAU37P9CbvIEkqLHqEV6HqddZNwL
	9D51IfvaP3FFsnEvouTU+KJ8OzHp3KrAhhVGjY7tqDLW9tZrnvhPOTX1I57teeRu
	RZS7RS7Ks83SaO1Lumb9DQXC2m1DlO4VPOrb06g8TN+ULeRourvPWidzg82Ygc86
	JKfOfpH/V5dDgL3I7eUM0ZJV9vCddagYwxk/g3Wyip4ZUZo8S9Cu7WnyYYlq0CzD
	zAp8mXBubh21sMQXx/548BTmPHKONyWu4xxnTQVYx129PguPzzpoxl6rZiuQAqzV
	umjWcW74GxwmI8b1QruDS3fAAugZoRC3zYQ==
X-ME-Sender: <xms:2fGpZzH1kjW1cznnMy7Fth5FQt56YXca2fhKw2Z2PiKVz57pQCq3cQ>
    <xme:2fGpZwWI_qbccSN8eHxbjboZeuLfTN42ppFqbSyMR5NjS0JVhsU5_jUyb_FiBkIoJ
    LaSHP_a2Rsgpw>
X-ME-Received: <xmr:2fGpZ1LAkHriZViKvvrJAwc8RpgpLSHk8hQW_HDtJx4ddvvPLS4K_EMaP3U65wf_trvDWeu3Dvlm-28VDFSO1m74TR2JEo1ckUTtOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegrlhhgohhnvghllhesghhmrghilhdrtghomhdprh
    gtphhtthhopeguphgvnhhklhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:2fGpZxH75ugoyUJio0AJWHubIyjVjTQNSL97eDP4CZzF94vRw63UgQ>
    <xmx:2fGpZ5Xw2R3mkWeYuHsP8cr-wPhvTBcXc9xPLwJHStbZU14Z27KNlw>
    <xmx:2fGpZ8PpMwSsgVtlI_no_gtk4qZs442-WQECtp0u-LkwCQoppNifVQ>
    <xmx:2fGpZ41LgXp-FMh6LAcbgxZu70ShqguYWTaV0v_GvYYW9xahhyGOVA>
    <xmx:2fGpZyPSIbyUvfJbrl8DhvnW9f4ez1ZxCBSgxySvc0cMgZNVFRYzCJSo>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 07:32:25 -0500 (EST)
Date: Mon, 10 Feb 2025 13:32:22 +0100
From: Greg KH <greg@kroah.com>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Fix typo in TTY_LOG message
Message-ID: <2025021006-dominion-straining-bcb6@gregkh>
References: <20250210121552.33455-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210121552.33455-1-algonell@gmail.com>

On Mon, Feb 10, 2025 at 02:15:33PM +0200, Andrew Kreimer wrote:
> There is a typo in TTY_LOG message:
>  - sucesfully -> successfully
> 
> Fix it via codespell.
> 
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> index 85322af62c23..1c3e5dfcc9ec 100644
> --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> @@ -542,7 +542,7 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
>  		return -EIO;
>  
>  	SHOW_STATUS(board);
> -	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
> +	TTY_LOG("Module '%s' has been successfully configured\n", NAME);

When drivers are successful, they should be quiet, this line should just
be removed.

thanks,

greg k-h
