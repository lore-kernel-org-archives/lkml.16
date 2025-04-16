Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BBB21E08B;
	Wed, 16 Apr 2025 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784803; cv=none; b=PHE/e/b7R1X4Mj7jZP353xMFWBE8v+7R3wFROqYyMRz5jR5qFgvOPcoOYqfwN6YZIH1K9pNppyjlRQm7miDLQStYoHR6icvxn+agTrjsCHApf9lIHRudBZVEUIZVZMZqF+itrlqq7MW0sl4d5qX6lSvuMjlDb1s+BmQvE2+nKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784803; c=relaxed/simple;
	bh=qXExFh5kFbkzyI0w2PnMys9YzEwBpEtjHV9rWBpL5TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ej5s7TtmiantE927oLaQqXZCx6Ve/l1ieGSBBOOU7Y8Y4lhpRtoXRcMYCW5eqYO50C3mAgP5sQR+rtWJ4Pmt47ywf3Zy6ZgGBrJomnuqsR8XGd0vJ7VDUWr6d+4/2PhVfKfydlgHKttvfmsQbEcEVozE9j2XcoZgNBbsbMm7Mj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeW3LmfW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeW3LmfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4345DC4CEE2;
	Wed, 16 Apr 2025 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744784803;
	bh=qXExFh5kFbkzyI0w2PnMys9YzEwBpEtjHV9rWBpL5TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeW3LmfWrBHzY1lOhCfzRXFLwBLqkoz6nloKZoj8W+HufqBkug5taNd8ErX9nMi4C
	 E0g6F33KURhueQoS4qRMK6g7Tn+tBq2RAZVeRbnL9wJX6XGmF8Y1IkTPWwS7WI3u5g
	 1YQBJvqyPWRPJuSfdwHrE48cO1izDAvbNVb213F26XMpn6rbzPYzgnadTotv0AriGG
	 GRDZO1wRqElgVdjm/MK7nJ7XNysW40u0lydDxFmY/nsLmUQMi7OjOhCAK/BJBYBYEd
	 sMrcpV+qZHOjZUFhillV+kvs65rxVZrT3tYCufaJ6VDKvFbjWSfjCvr4Ky09Su0X0J
	 gHz1tQgp8rD8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4wEK-000000005y0-2JmE;
	Wed, 16 Apr 2025 08:26:41 +0200
Date: Wed, 16 Apr 2025 08:26:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Michael Ehrenreich <michideep@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ftdi_sio: add support for Abacus Electrics
 Optical Probe
Message-ID: <Z_9NoO4Ma3LrP72L@hovoldconsulting.com>
References: <Z9ewW-63F212DcV7@veno.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9ewW-63F212DcV7@veno.localdomain>

On Mon, Mar 17, 2025 at 06:17:15AM +0100, Michael Ehrenreich wrote:
> Abacus Electrics makes optical probes for interacting with smart meters
> over an optical interface.
> 
> At least one version uses an FT232B chip (as detected by ftdi_sio) with
> a custom USB PID, which needs to be added to the list to make the device
> work in a plug-and-play fashion.
> 
> Signed-off-by: Michael Ehrenreich <michideep@gmail.com>

> diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
> index 5ee60ba2a..5de8067be 100644
> --- a/drivers/usb/serial/ftdi_sio_ids.h
> +++ b/drivers/usb/serial/ftdi_sio_ids.h
> @@ -1612,3 +1612,8 @@
>   */
>  #define GMC_VID				0x1cd7
>  #define GMC_Z216C_PID			0x0217 /* GMC Z216C Adapter IR-USB */
> +
> +/*
> + * Abacus Electrics
> + */
> +#define ABACUS_OPTICAL_PROBE_PID	0xf458 /* ABACUS ELECTRICS Optical Probe */

I moved this one to the FTDI VID section higher up.

Now applied, thanks.

Johan
