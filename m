Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C241F12FA;
	Tue, 11 Feb 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266155; cv=none; b=O0HcrV+IwLNZZ2uzPB57M3ZegWQ0BA/XegEwfZkcecjDYUD/otHVPmStfVJZdKVIzx0UrT3ZT8L9D3C+FlnC5AxFuNLrIa40XxX4w0RK4JZoO/rbj2AldKavhvCZEhzTtPiiT1t7v5ETMEu8hnrD5BHU3hkkdBq9cDlnkf/VmE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266155; c=relaxed/simple;
	bh=DBFsBaL8EBKY3Sw0vJ1NTvA+B2mhHnikqtShBwayF8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAQPMtl0Jfj3wXZWU1ud9MVmJBD8IuPlG9jjAYa9r95EOzvAg1s/+QD3aOtKniAzkP6WjMYCN4dL36aO3FtJ3odNdyO8X3OQ/sMWmIswkfMUJrtibByKBWrpK0eXpxplfRGFEfNOQhxs1mwStLizo/mbFDijCwOfVd512TN2gKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAHUZhMs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAHUZhMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ABBC4CEDD;
	Tue, 11 Feb 2025 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266154;
	bh=DBFsBaL8EBKY3Sw0vJ1NTvA+B2mhHnikqtShBwayF8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAHUZhMsKRY/l7n8HbwyNxI5/ZKOC9zo2UrrPQJ9VySW2AoXYFG7HrPX725+ICVn/
	 i6RvjA3uJyrYzhFtbqe27Qom1LqDMYwwywi9zvlwuEaeF2K8nXJ4J4FcqGUBVlh+CU
	 1TNpD5M53V4gSOHnuZGzpn/Bz3MuPTJJFW9wMxF4Cji6CstKaEFxULc8AYuvg91gEd
	 ioR88bvXVTKnBeoaNkXxVEf90Rq0Z1MRXG5DYLzTodyMwsXTGZ+o6dGBf+TgF8x108
	 Jxc3qwt+eY3szNKSKnUJfYiN6nQm/yD7pFsB4Re3bykjhFARv4kY8PDAt0N0d9wJ54
	 I40P7QUZa9/CA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thma2-000000007FF-0wIU;
	Tue, 11 Feb 2025 10:29:22 +0100
Date: Tue, 11 Feb 2025 10:29:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drivers: usb: serial: mos7840: using '__func__'
 to replace function name in dbg message
Message-ID: <Z6sYclmvaAQ93bEI@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-5-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-5-tony467913@gmail.com>

On Fri, Oct 25, 2024 at 02:17:14PM +0800, Tony Chung wrote:
> fix warning of Prefer '"%s...",__func__' to using 'function name'.
> 
> Signed-off-by: Tony Chung <tony467913@gmail.com>
> ---
>  drivers/usb/serial/mos7840.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index b48a26468..31ec2cf1b 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -230,7 +230,7 @@ static int mos7840_set_reg_sync(struct usb_serial_port *port, __u16 reg,
>  	struct usb_device *dev = port->serial->dev;
>  
>  	val = val & 0x00ff;
> -	dev_dbg(&port->dev, "mos7840_set_reg_sync offset is %x, value %x\n", reg, val);
> +	dev_dbg(&port->dev, "%s offset is %x, value %x\n", __func__, reg, val);

I suggest you just leave this as is.

Johan
