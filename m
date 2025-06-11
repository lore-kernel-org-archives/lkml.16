Received: from sonic303-21.consmr.mail.ne1.yahoo.com (sonic303-21.consmr.mail.ne1.yahoo.com [66.163.188.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453641C5499
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655899; cv=none; b=iRzHdcqm9Kf7/pLlkZWEMQv4XWHYi7yJyGmDSNy1DYNEo093YJVTKJOinflGU0DjBqyxZfNTdR8f1h6EbWNsfLr0817eJUAAdYypTSz4rjN7BbJf+6WjrigVO+02snSnH0BUEIBL090bHLROe9iBJX4n7p/hHYgxkKmYjzLqU+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655899; c=relaxed/simple;
	bh=O1JywEeb2SRqn30Trzh6Qn2o5IMAYLE9KIF+A4OvcXY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ErLApVkjUkHTblB3APjYRZctWLCRT7ecX83kqFJ/5Xqj9KSSX7YbyJ/XX2nVajwnnfTxZkI4A5JdtdH60XdSYD60yj0ZOYHgOj6yyWheaAQjHjehy4bvioVKhMSyPY8iMousUqXbin7gTB4xSbT/UAnSJfS4WWMwBmmfqD4YWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=FuF5seys; arc=none smtp.client-ip=66.163.188.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="FuF5seys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749655897; bh=+9p/gmrzccoejMVdna8AayHd4NMaJeGHWc5VXU5X5K4=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=FuF5seysf6pjZo5bzPi+kxGNVcbHHdrtuFlpkM7RnHaWsDw39g5qh2iBjy9zA+m8OydkPvPWXDU5vHerZkY06qc9aH80I+yPE5E9nB5vtYv6oh+82nqILo5heSxg1e8uEL/g40DW/NtVPviTyBcUUw8mtLgKnRGjH34ZnyvQbHiu2WHUGbKQo/db7IPeEZ+X7ps6oYVCOaRRWR17UyHSbKFQhKyBGOhwUtfwItX9em/pYQmrpUOtravFlljOFzLoMy3f0vk1uPZxE4vCFtB+E++zFI94aP/Si555HQTYJ+ISRxqmpoOkgFWs9oqoRL4f9iN7uMXMf3pkbbff96jFbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749655897; bh=pCFwiCpAkNxB8dlXoe0CSwnpGaGAS5UPIbiS9F+F+oI=; h=X-Sonic-MF:Subject:To:From:Date:From:Subject; b=D0mTxslhmla/32EBAktN6NOfS6ZJqE1v71FqEkQIR300o8us+fwUAz3IIZG1My57q5UnMobAHZRpqYzPv16u4WXDEjrGRCzBc4SoWdpnVdaohIfucxQ2wbsHUglSoZDPatFYsM+F6ElV/AgZeowRkspKlnNpFiprtILMzV42Os+fptM75dDMtHAzFMnVLQLHQWySsD6yP7Qie7RpSirY3yl+BBwqCeEET4Br5bVHPzryWLCecQWDVLGULSi+CRoPD8dfIQ9WQI9eSD1Wth2ZUYzQbgAZc2eZNsw/WWGbOELpHj9X+55xPBgEr/hWFCtaq/8VI//Dd6r3U7Kng/aN+Q==
X-YMail-OSG: 5ZFNKqwVM1nrAZJ4PLR8innhmoEpMKEVeY0MT5z3HTBpY3SkqPQuvPyDkyI5by4
 m4TA8gAQohMzPG_93_xIKYnI_KPDy3lwaf6ab7Q_aqUWOfB8wu2uXEDfebP5bxQHU._A_nOdUpCb
 HVURPXqJlI3RXFVRsZPdkx9UW98nJefyN9T2QYLK_g.bgHOxsVTYLl6FygtaSS9JWW18ObWVIdZv
 MYeemmWnyNOLTWBR_Si_7OUJQ.K9Ky2LaHgTaLJAlRTK8TzGalu3wjl26KaqIr60CSi9wQM40Iwp
 NI8CYLHZXp8jXB6UIooKT9B0FtOvC95Z0CFPxGpnrXlaC61BliIccSIYprHOvWl6a6fyC3ws.rH8
 jZSuYpm43yQZ6Gc2sLn6YhuSv3Blna6xDOlpq_oEh7h3vwJhE8cZD8tq2HR1D9CZUbeIr2Dg269U
 24.EkyRYKf72y8_BCZExVOKxwSvQtRjINSfLLhc2tliD_MDgKbW.RpS6AnoFrGTPeo.1uOQjF1lh
 oFSKPy9WeACyA550Re8C_P4x9evnBZeK9yLuXZfk.uR_x2va46IPPxx4fv5hadHo_7XITnRO_m3a
 .Ti4S2v6DPH_82mn3VkglsVOwklO50UCRM3KuSCNVc2841vQUeZtrspwcXOfDv4efmyWVjoVNJcZ
 FkvcW.UsschXNFT8v7PA68ECPEtnmkbGU12Q7.IcjoZgHcWS3J6ctGkCsWQ.HsTjONxG3q6koaAU
 1S7W9ADc8iMmrTQJzlWh5kp58BEu0RSt7Sd4Ijl25_PsQ3xK2V5TDl8kbX4hGGtP.Ninh_k3bMuF
 s1s.GNBLQS2Z0DiQNJ2g7UsdU9FwXZLo7wyeqkyX_WYeSfXfo.aMtAm6x4xtTmvkuKb3mA0JNUcZ
 9EPrTr8Q694bFODZGYp0fZTmdDhA9FZhBej8bBwXhNzjTBR54JBejsdOVn1laZhQq28J7FHDNd0V
 AExy.eQJOIrSgbStLPqlxinei8EJ5.UIvTmqWEo2ZFSI8ef8BjMegZcSIupDQ6b3f6phE0Ub1rR5
 qSmDA8UvFHB.Xr0dqajMsZgysP9LLrPb_2FM4835R7e6XZqI9DAki15xGTAOD3Tl9P_TwyB7sAX4
 2mbEdzONUtT3YIZ.50dKKr9rrqdqa3WQm4xwFzPDubb35_fjuJC6u3en.qflGU6uBSVHXdQnUU4b
 mJviVAu7iiOzOUI_v3uSOFeJVdoqEsx2w4ZFraIBPfKShjxiwnvLwIWuXaAEGJDRNWV5rAHhOVrK
 88tTpAHKHJKPDr_ZeAsWWpGrRJhmBR4OZHpEBmL_aTql54dMHlzua8ZU7aHLlqB1Cmcg5ESsned8
 .f_RXxZ.lXqilMxX9aMRSuPj8brb.YrRNDVdMt8qbdwStJGTfcemZmiBK8cNKbfFwvK363cfT6m6
 ALYASb8AcD1dK2TDYsy27hEwtm_8eMF3HCVaV1WNogOPqpuwqR36uHL29QSF1xqKjuntfdYjvtTE
 Fn4h0Zna.m_Kk.bL0yx2VaxlolifogeYq_Fe4ao0eFRQ43XZ89YFLCwymxmczOe0P5P5GgB4CRlT
 PndpNCuhXe08s8b4a_ETAu8oQQ7JYRTPUostIKI54sbRIG9fllQ8u7GwuVIOHLJ.GnjD7zi3ZKO3
 .ar247PwQ8PpF9VphcwhgSOpq.iqRbEiOEGR5wTZTBvbfi.2mVyagV4iRk1RRH3ifOT7Eg5Fh3Qj
 MAg9iWYDuBYLjFmAvVzds8nx4o9WLsIqZU_FT_9GGx.IOwSZRcIG5lYmawtYvuZCQt5HTtaEH2df
 WB2ZAkuC3oAVpwuWj30cDJlc3lgBRB6yKRmn9UsQaQCpG8r9UGcv04FTBRQCtX5E5PxbWiAsFyDE
 ByBvRvKJKBBoTrdBhSG74DFPliep_QaVGdC61QIZlFo7uH2WhzCQzdf8xNX8al6GTARYdI.Cfsvp
 mUSA7z3d0Q5fGbiN4YrjX5o9q9oQ1CDouzq.68qOeQhxlwqpJQ8NJDdrIN3nMhRwRNQoaLNs.1bL
 BCein4o493rNUMefI.Xzc8o3vjGSYC7TTs.605Au1RUrvXt3UQ8znbyQlm4o4OGy.mvmPUR471gh
 fzZuZ.YPBSV73BSy7dtcnk_GnFvWchNv1qqP9V6XDln6oa6PyFZz4suaIU.F_lFGJbBf3d._Anre
 SU.TEmlJBX1ILMejbLktKRaVdumuxIuDx01lO1z92UT4iMdM19kvi84_BBNdXPjFz0B6bMIYWHDp
 jUDnjK03M.7fsZRp260ea_hXHuIoy4_3gJBKWwE0dUJw_KIT6dxxAVfSmrNhgOnjR8oHBTg--
X-Sonic-MF: <userm57@yahoo.com>
X-Sonic-ID: 9d5f826e-d22f-4930-b42e-ad05fb16e7bf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Wed, 11 Jun 2025 15:31:37 +0000
Received: by hermes--production-ne1-9495dc4d7-nmbx6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1f0b11c12d0c4d4c7d6991c536a92356;
          Wed, 11 Jun 2025 15:11:22 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] m68k: Bug fix and cleanup for framebuffer debug
 console
To: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 stable@vger.kernel.org
References: <cover.1743115195.git.fthain@linux-m68k.org>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <255c7fc4-aa15-fe51-94db-90029b22e479@yahoo.com>
Date: Wed, 11 Jun 2025 09:11:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1743115195.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23956 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Tested-by: Stan Johnson <userm57@yahoo.com>

On a Mac IIci, the three patches fix the lost-column issue.

I didn't notice any regressions booting the new kernel to multiuser
and accessing serial, scsi and network.

-Stan Johnson


On 3/27/25 4:39 PM, Finn Thain wrote:
> This series has a bug fix for the early bootconsole as well as some
> related efficiency improvements and cleanup.
> 
> The relevant code is subject to CONSOLE_DEBUG, which is presently only
> used with CONFIG_MAC. To test this series (in qemu-system-m68k, for example)
> it's helpful to enable CONFIG_EARLY_PRINTK and
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER and boot with
> kernel parameters 'console=ttyS0 earlyprintk keep_bootcon'.
> 
> ---
> Changed since v1: 
>  - Solved problem with line wrap while scrolling.
>  - Added two additional patches.
> 
> Changed since v2:
>  - Adopted addq and subq as suggested by Andreas.
> 
> 
> Finn Thain (3):
>   m68k: Fix lost column on framebuffer debug console
>   m68k: Avoid pointless recursion in debug console rendering
>   m68k: Remove unused "cursor home" code from debug console
> 
>  arch/m68k/kernel/head.S | 73 +++++++++++++++++++++--------------------
>  1 file changed, 37 insertions(+), 36 deletions(-)
> 
