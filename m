Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A733C9;
	Thu,  1 May 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114094; cv=none; b=XvWWKZhA67OKOOjZ8mgv2SCnfotzb3+uLYEH22RkLR6ARRtzsINxgYViqdKcwDClmihFCaip3b8n1U1c8UQ3BYyBLV358QDgH/pvYDozxatQvhes602dsCJS972eQTaChwYYa0JqoTBjx3DKGQdG0qjgvWfb/Qmd0qRNKSAw8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114094; c=relaxed/simple;
	bh=wCcIZ2HaYnn6wpdRf+mldkvw+Bpb6dXIPcM7KQdQj2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=di+JLubsco3SxjVmspga4ujL523BA6irwwtUdN0K6sq1dSc76jboUjnyKoNW6YE7NrRcZQoeE7FxeMpF5laNwXIDbzF50AGEqAPaeu02kkv8B+OBIIRS91I8Ct1rXt0MzQitozudFRlDw9pi+6A5vYS/GyMlkxHS2+1BOtV6gjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=puT/iB0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="puT/iB0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA081C4CEED;
	Thu,  1 May 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746114094;
	bh=wCcIZ2HaYnn6wpdRf+mldkvw+Bpb6dXIPcM7KQdQj2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puT/iB0TXxZlw1Mqx0/IwwBNAGdK8Z9h7ZR90Zp68nLI06qe65AoqtooC4+C+XTFO
	 VqG/DwHqdjG50SiMZsQA4z9zvwF4uIaRquPU+d9KtsKaFBGjSXu4NlWlYMbPfKkU0D
	 x9c1dV/Qu2B8MFk5L5n4qhPfQkJED7oFeGFIL0sw=
Date: Thu, 1 May 2025 17:41:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: apply vbus before data bringup in
 tcpm_src_attach
Message-ID: <2025050116-hardy-twins-913e@gregkh>
References: <20250429234743.3749129-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429234743.3749129-2-rdbabiera@google.com>

On Tue, Apr 29, 2025 at 11:47:42PM +0000, RD Babiera wrote:
> This patch fixes Type-C compliance test TD 4.7.6 - Try.SNK DRP Connect
> SNKAS.
> 
> tVbusON has a limit of 275ms when entering SRC_ATTACHED. Compliance
> testers can interpret the TryWait.Src to Attached.Src transition after
> Try.Snk as being in Attached.Src the entire time, so ~170ms is lost
> to the debounce timer.
> 
> Setting the data role can be a costly operation in host mode, and when
> completed after 100ms can cause Type-C compliance test check TD 4.7.5.V.4
> to fail.
> 
> Turn VBUS on before tcpm_set_roles to meet timing requirement.
> 
> Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Does not apply to my tree, can you rebase against usb-next and resend?

thanks,

greg k-h
