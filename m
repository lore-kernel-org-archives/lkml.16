Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFCA1714B7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666002; cv=none; b=F4bqWKjxVstIJ0l5MLZaafEl1Kt2NAFQdNmW2N40qfZj3NTOS8xMxHwgmxeMN7cXOaYplmdnhzC5nEXyKaZV25fKAQnX3hxuiJP2LjvbvVEbF78irI5YcurblhBv3NtifeWD5GZPU38RssmxBgreGFQeBXRh0rSUKJiEzP7Wp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666002; c=relaxed/simple;
	bh=/MB5fkLTvXX655jtNwONyszz/4e2KSscyQ90ZFkTraw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma4ws2PTxid0B55cXsOpiA2oQW4C0UpldB/HlkO9doDR2lr5IPzhmCBEBZ8xglMEcjk+9lS/8wXdAPKcL8eARmOvmbw6fLdmKLLFIZlRUY4rOznu71ntZ0+QrVYWiPlm8iSGiwU3qrRyV1dboLNk92Gg6EUeBbUiZjZfHeaH+ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fifn7Hub; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fifn7Hub"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e1782cbb2so3925555ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747666001; x=1748270801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kADBuowxof65udqYDbFHGBx7vhRtqalFqgiYXXItF9w=;
        b=fifn7HubBKuWwm9DTlz0rmcVjZGOhZ8bK6fwcVZetQT6tuEJqPCzy0P5K8tus7zP/0
         D3xCtoRMCwXVdhILPOUCR8Gl4pVUl3eVbj8bAy35yPO5OhuRKWV2xR0EF710gVsF2Qqu
         beq0Bnl1beB3qUk2Gr2kqDE//DE0L3OTPZWd/ys20uIv62ImaEjsDFtWVk7Ak8NaFvzC
         YfOXYr0c7mQVJNZkWTwdfM48+UPEXPmXlwZsHyabrGnOu7cX0tw9yIWWvvU1s5/pG6Px
         Q9j5iaxg4oJxGtnkEHg49z0GoA086K2C8rSChrm9e2mNd0fPCocAv6xZxydWISSLTD76
         IIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747666001; x=1748270801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kADBuowxof65udqYDbFHGBx7vhRtqalFqgiYXXItF9w=;
        b=GGelhoyin/sw8abQtvffeFRDzv/LzqXK3WTxU/V3cHDVcs2sbQUuG4vAFVsEyL1QF9
         5KGPXmtqmHVPqNJzv4wwZzsLSI7HrYXgagG7UQWofv+pYTduqRT9fM4YgDHRggsDnJ2P
         KyQts3VH9iXjKdvaajhfjPbdDpN2O07MR7xAub03069n5FJrPm86vi+WxinV62VIanDb
         QHvL9K0QBSoGwBLMX/Zt9NIFpmzbVfa6iFZmhCBz94S2kahau00s39wL+GxL2sWxfrQU
         IHvt7jiQNqlqjMLUxWFpIvDBOHwTdS3yMlfU8hxT7NH0XrSkgZxIm7R1eG3lL72W2eJe
         qk1g==
X-Forwarded-Encrypted: i=1; AJvYcCX8Vy4WrKEie9lLg8Cx1XVJPKgrhzyGydN7EmifdUFCx4OFflmzAf1+ilbjUS8HdPGOAkEWX6Pk8c4A7K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhuU/hUEE8BCdAmWc3X7FfsJskXc/zqtXRw81q3N05rRm0PSjP
	SDH/QdZKtMxD0/i+/y9rsIebX57siQDy/rikkXgXc7PZc6iyyFYtgJv14BGj3HuMTa0Apqh58WU
	/UupgvleM4Ntl+l8SdCtJkcHaj4SSJog=
X-Gm-Gg: ASbGncvfzGkbRo7UWwSvdwn8nsF08V+HH9gtv8UhwQZoAlrTGu+sWGldruBZLCd+0mp
	nEF4kp0VX08/zZd1dK8Sla+Pr8xwhZRqdFgu4/iiOOh/6hozr28A9wjPZiKhCFYXKY+GoMmFNd1
	auUG9I/wyT/C5WwQKXqyrxshnpFaHSAeveEQ==
X-Google-Smtp-Source: AGHT+IGxUyLpuIzuYI9yQN7+ja/Sm14SmFPcRyk8rO/gYDn+dKFkO1xwmMC+JwJVaVoj6ptwii1tfKmvJd5SMChDWjw=
X-Received: by 2002:a17:902:d54c:b0:224:10a2:cad1 with SMTP id
 d9443c01a7336-231d45168bcmr73303035ad.10.1747666000574; Mon, 19 May 2025
 07:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516233516.29480-1-daniilryabov4@gmail.com>
In-Reply-To: <20250516233516.29480-1-daniilryabov4@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:46:29 -0400
X-Gm-Features: AX0GCFsQQ8F-uOPfM0f66pMmiUGhGWImNrxgkYRyjyQpnzmvoHwfqxmPEhSQLO8
Message-ID: <CADnq5_MObnUtQ+VC+qc1fmdKZ8=XVWRRm5rS88-BmpYTtLZfOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix typo in comments
To: Daniil Ryabov <daniilryabov4@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Sat, May 17, 2025 at 8:38=E2=80=AFAM Daniil Ryabov <daniilryabov4@gmail.=
com> wrote:
>
> Fix double 'u' in 'frequuency'
>
> Signed-off-by: Daniil Ryabov <daniilryabov4@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/=
gpu/drm/amd/display/dc/basics/dce_calcs.c
> index 681799468..d897f8a30 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
> @@ -1393,7 +1393,7 @@ static void calculate_bandwidth(
>                                                 if ((bw_mtn(data->dram_sp=
eed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_ma=
rgin, bw_int_to_fixed(9999)))) {
>                                                         /*determine the m=
inimum dram clock change margin for each set of clock frequencies*/
>                                                         data->min_dram_sp=
eed_change_margin[i][j] =3D bw_min2(data->min_dram_speed_change_margin[i][j=
], data->dram_speed_change_margin);
> -                                                       /*compute the max=
imum clock frequuency required for the dram clock change at each set of clo=
ck frequencies*/
> +                                                       /*compute the max=
imum clock frequency required for the dram clock change at each set of cloc=
k frequencies*/
>                                                         data->dispclk_req=
uired_for_dram_speed_change_pipe[i][j] =3D bw_max2(bw_div(bw_div(bw_mul(dat=
a->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_fac=
tor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(data->maxi=
mum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->=
dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k=
][i][j]))), bw_div(bw_div(bw_mul(data->src_pixels_for_last_output_pixel[k],=
 dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk=
), (bw_add(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k]=
, vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dra=
m_speed_change_line_source_transfer_time[k][i][j]), data->active_time[k])))=
);
>                                                         if ((bw_ltn(data-=
>dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max=
_dispclk))) {
>                                                                 data->dis=
play_pstate_change_enable[k] =3D 1;
> @@ -1407,7 +1407,7 @@ static void calculate_bandwidth(
>                                                 if ((bw_mtn(data->dram_sp=
eed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_ma=
rgin, bw_int_to_fixed(9999)))) {
>                                                         /*determine the m=
inimum dram clock change margin for each display pipe*/
>                                                         data->min_dram_sp=
eed_change_margin[i][j] =3D bw_min2(data->min_dram_speed_change_margin[i][j=
], data->dram_speed_change_margin);
> -                                                       /*compute the max=
imum clock frequuency required for the dram clock change at each set of clo=
ck frequencies*/
> +                                                       /*compute the max=
imum clock frequency required for the dram clock change at each set of cloc=
k frequencies*/
>                                                         data->dispclk_req=
uired_for_dram_speed_change_pipe[i][j] =3D bw_max2(bw_div(bw_div(bw_mul(dat=
a->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_fac=
tor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(bw_sub(dat=
a->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency),=
 data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer=
_time[k][i][j]), data->mcifwr_burst_time[i][j]))), bw_div(bw_div(bw_mul(dat=
a->src_pixels_for_last_output_pixel[k], dceip->display_pipe_throughput_fact=
or), dceip->lb_write_pixels_per_dispclk), (bw_add(bw_sub(bw_sub(bw_sub(bw_s=
ub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_lat=
ency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_tr=
ansfer_time[k][i][j]), data->mcifwr_burst_time[i][j]), data->active_time[k]=
))));
>                                                         if ((bw_ltn(data-=
>dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max=
_dispclk))) {
>                                                                 data->dis=
play_pstate_change_enable[k] =3D 1;
> --
> 2.43.0
>
