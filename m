Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C546D214A6C;
	Fri, 28 Mar 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156471; cv=none; b=GFwol/YiNykBeP0JWAdpbnH9NdWwnsVGgssb+yamwN8wqt/Pb/E1j/hxAK71hhYzftUy2bb/1FVCccsSXigeS1u9+NmOUm/8/IVDTNJ5HaPBPMOkB6uQbeohJP3sG+g79PcDZse/4MpWhVYmde0Hacp/hTZaQDJ9yxtpC3/s0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156471; c=relaxed/simple;
	bh=+1HJvFP+Fnoh7d+9TIk7uMpD7sPCQQnqKb2PNqUmOU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Up+6Fm5jgD+k9THczqf0uqQ5z99Gg4MCLbqWs+1CE63sAwV+GlDcS7IajmsvdSKV+SHlk58ZHc/UbH4w0TJNzkqlHe0qBXh1nB1blxmKUE8p69EXnY8WgKROfHwGM5yfQEI7K4NN+46jSvWONRF1JLuUJ2iZKOblAkuAJd5kJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lBOmgQAL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lBOmgQAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EB1C4CEE4;
	Fri, 28 Mar 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743156471;
	bh=+1HJvFP+Fnoh7d+9TIk7uMpD7sPCQQnqKb2PNqUmOU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBOmgQALXFg199JPQfsWBARuppG7vjLbxg3obc+aOfP+O/QHiuOIDJ83EWhZmDNxz
	 tPRxf8qp5reEq+l1yyMq5xRA6a4Cu+BfRJESvs0mLNYk7uIlnkokjos0A/AqVHEFJi
	 CRIpcUH859Nsnb//lxgRjEUbe3VzijMHu75gZaI8=
Date: Fri, 28 Mar 2025 11:07:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: madhu.m@intel.com
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pooja.katiyar@intel.com, dmitry.baryshkov@linaro.org,
	diogo.ivo@tecnico.ulisboa.pt, lk@c--e.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Add the UCSI commands in debugfs
Message-ID: <2025032833-finale-buffer-2343@gregkh>
References: <20250328094305.546724-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328094305.546724-1-madhu.m@intel.com>

On Fri, Mar 28, 2025 at 03:13:05PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
> 
> Added the UCSI commands UCSI_GET_CAM_SUPPORTED, UCSI_GET_PD_MESSAGE,
> UCSI_GET_ATTENTION_VDO and UCSI_SET_USB support in debugfs to enhance
> PD/TypeC debugging capability.
> 
> Signed-off-by: Madhu M <madhu.m@intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/debugfs.c | 4 ++++
>  drivers/usb/typec/ucsi/ucsi.h    | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> index eae2b18a2d8a..92ebf1a2defd 100644
> --- a/drivers/usb/typec/ucsi/debugfs.c
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -34,16 +34,20 @@ static int ucsi_cmd(void *data, u64 val)
>  	case UCSI_CONNECTOR_RESET:
>  	case UCSI_SET_SINK_PATH:
>  	case UCSI_SET_NEW_CAM:
> +	case UCSI_SET_USB:
>  		ret = ucsi_send_command(ucsi, val, NULL, 0);
>  		break;
>  	case UCSI_GET_CAPABILITY:
>  	case UCSI_GET_CONNECTOR_CAPABILITY:
>  	case UCSI_GET_ALTERNATE_MODES:
> +	case UCSI_GET_CAM_SUPPORTED:
>  	case UCSI_GET_CURRENT_CAM:
>  	case UCSI_GET_PDOS:
>  	case UCSI_GET_CABLE_PROPERTY:
>  	case UCSI_GET_CONNECTOR_STATUS:
>  	case UCSI_GET_ERROR_STATUS:
> +	case UCSI_GET_PD_MESSAGE:
> +	case UCSI_GET_ATTENTION_VDO:
>  	case UCSI_GET_CAM_CS:
>  	case UCSI_GET_LPM_PPM_INFO:
>  		ret = ucsi_send_command(ucsi, val,
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 3a2c1762bec1..72b9d5a42961 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -123,9 +123,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_GET_CONNECTOR_STATUS		0x12
>  #define UCSI_GET_CONNECTOR_STATUS_SIZE		152
>  #define UCSI_GET_ERROR_STATUS			0x13
> +#define UCSI_GET_ATTENTION_VDO			0x16
>  #define UCSI_GET_PD_MESSAGE			0x15
>  #define UCSI_GET_CAM_CS			0x18
>  #define UCSI_SET_SINK_PATH			0x1c
> +#define UCSI_SET_USB				0x21
>  #define UCSI_GET_LPM_PPM_INFO			0x22
>  
>  #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
