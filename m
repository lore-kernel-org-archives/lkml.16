Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC969202C45;
	Mon, 16 Jun 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083733; cv=none; b=L//1qux9ykTT20Az/FOetSul2lp5rZ/IC9KxP5zi02x2XsQ8vm1ZY3V3gUfFSVb8TWBYje67OMOYlzYH5WYrrlc1XRie5wqDfcKe08iFeoyZScApJQnw1hEWNLhSfKx9qVNQdx27Ezb3gGORBb2NglypGZDGOYoxArw0/fVSk9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083733; c=relaxed/simple;
	bh=w3qlB53f/GBeGtB69jsSIgdaSqItAk3kns42RMiReT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny43QpfvwbU8a6kWixb/NSc82+4nEX1jB6BmI2P0Y0zqGbcHufVOrOP8hfc/Q0tQkBn5UeYymXR24Et6M1rtd2a+zYCO7j4MH0TaIqxogjMO56VOiDOnUfz4/zLHtUcRC20r+1YI0lv94Jjy++I37uYKFOA26v/vLuKvum42LHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZfqEau9s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZfqEau9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA91C4CEEA;
	Mon, 16 Jun 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750083733;
	bh=w3qlB53f/GBeGtB69jsSIgdaSqItAk3kns42RMiReT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfqEau9sDh9uD6qW9wORuYTrN4u60uvBgllx5gFLDzOColOsne8jqcvorHEpM3BnX
	 YCtpExAiOZJH6rAmyPkezNBA3K7CPX3C0BtdLJDt1s6+GHeEkE89evAdkyApwKgPDe
	 keumeTI1wstxBbpEMr/bGEddwq3zxZ3CRFRJ+qP4=
Date: Mon, 16 Jun 2025 16:22:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: aahringo@redhat.com, teigland@redhat.com, skhan@linuxfoundation.org,
	gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] fs/dlm: use scnprintf() in lockspace show funcs
Message-ID: <2025061659-sauciness-ravioli-ff59@gregkh>
References: <20250616103441.370330-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616103441.370330-1-pranav.tyagi03@gmail.com>

On Mon, Jun 16, 2025 at 04:04:41PM +0530, Pranav Tyagi wrote:
> Replace all snprintf() instances with scnprintf(). snprintf() returns
> the number of bytes that would have been written had there been enough
> space. For sysfs attributes, snprintf() should not be used for the
> show() method. Instead use scnprintf() which returns the number of
> bytes actually written.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  fs/dlm/config.c    | 2 +-
>  fs/dlm/lockspace.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/dlm/config.c b/fs/dlm/config.c
> index a23fd524a6ee..10486a46a540 100644
> --- a/fs/dlm/config.c
> +++ b/fs/dlm/config.c
> @@ -185,7 +185,7 @@ static ssize_t cluster_##name##_store(struct config_item *item, \
>  }                                                                             \
>  static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
>  {                                                                             \
> -	return snprintf(buf, PAGE_SIZE, "%u\n", dlm_config.ci_##name);        \
> +	return scnprintf(buf, PAGE_SIZE, "%u\n", dlm_config.ci_##name);       \

sysfs_emit() or no change at all please.
