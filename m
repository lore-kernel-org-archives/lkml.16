Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2043347DD
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750583460; cv=none; b=KB9JW+diIzvfwQcFulzbDQgvncCa+r2SwQni8o7et8D4d5vSUVirOYJiaBLQYx64sAoehonf4uG57bhjTdXbTCi+bDn+CPPzWCxy/9nKbFylw1PLl1uyCrx6I2U49XKh0cyns7fyNM4rDfuEaST9ZNugy8Hi62zq+MEnt6IRQIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750583460; c=relaxed/simple;
	bh=yv8hBoeWI2ZvnUm4bUXEBHsQMdVcWu45KP8EqjJB8Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCMESThVKcLOHGXP1KL7FCJHv4EsATv3HFAUNfhw4qy2o9W44995txhKEyacPSPD+7rNpEaFfYzPhQSnYXQv3sMIph0uuwxHYYajbe8Jy0MA7sF1r0SEAJP+doclPm7oNy4OTcB1HxmtojTBSVaxZjiURPDe5EGNNKKxyEcy96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mu22jdik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mu22jdik"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M4tGXJ012709
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qt+O+QxJlGXHiRIxiCfwaz1cbAdlYYSWGo/0TxccAFk=; b=mu22jdikSxLV9jLv
	GZ3cv4NvxDXG1vKqhIy8xSMW4LxZdnFWMWIzMDs8iYR5QEQBY5Vcf/Xx5DZIl5wy
	LNklLFso+3hhxPAun2pTzqVHlBGaTkrBLkWiULEn9Sengfld8M5mBaQphzhNfnhu
	AkVlryau99/I3BgADk2OD4yeq+e084OyEMea7BCbWqRrkG4Jk8PL3Y+cBjqrqDaz
	Sou8/1UaLkHVhn8yPYvTOQeeOx+H2gbAnqbDNrj0Go0r6JIy70toY15LAdRZQ6sb
	r7i3hFXnxggywbQtoTr7gVoflRsaeruqHDm3UYOdKHAN7wKOCpynnmWgo3/UTJUW
	4oO5qg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e86jgddt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:10:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so502902185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 02:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750583456; x=1751188256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qt+O+QxJlGXHiRIxiCfwaz1cbAdlYYSWGo/0TxccAFk=;
        b=Z6Qt/ADMEYzgeu1f0g+SNoqScDNyRW8bluN9JT9x/AIq1LNvU/KgYs9rtQFAgY7y+F
         dNUtB7xEnda+zoDuPavgTJ3ERcsUL7yWrsijUXFCrzHcBTh0DENY0fz4fnVXGXxNpsQw
         Kv3bVshycA7okGXwMYF1hiH/iQ69VoZM5bEgb6jCFN718JHkpYkHBqMextdKDlKQj4kX
         G+nUq6Z2KbLTCKtruo0ACGlv3hil6ss49X9GewNwtdS6KiKdXlt2Z6Ex8Q38hyFm3eh7
         iNyXNNb2G5AJFCCfPfPt8VTGb0D+tT0yJEBJ1xYTHEvvDD4JaFSk+c18wvBghuq9NulT
         ZJfA==
X-Forwarded-Encrypted: i=1; AJvYcCWPESn7ughit0NXd/VyQaF7/M/0BplteVI1+YJ/n/R7H6F5Y8EeWKF52A5zH+LdEwEjAeqPHQ0i1f5QOXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww5Ofw27Vok2MMQMi7/Bf+Ov5m78vdS13moXXIfneJlH28drHb
	PfkEKLfdqbcHRPlOMYdBifVjS8URLE4gB7hgqEpiYVwuOdaPui4Egc8vD2jSIisDmiNsmNQD500
	vQLJS2lLwa3DiCR5RMSMRsG64rmy1DdTyZ/9ivFVmYyx7kgYjuC05Ut3AA4cKMX4AGmO9ttWGS+
	sVdKCZCMdEB6C8zoM2sCkxBqcknzpedctc3issn30jm1MYOVtpZDn3
X-Gm-Gg: ASbGnctp2++spRMmrBVHL1Ixi+ybwOyRZvvzRDvrX9IkX1wER1LmQvea49r+SNkj5Z+
	2By6A7MesnvYOXaRYRZdqPR7IcesffDdbhn2nrjoylKxeEPqv82bXirlCQMFz6MlQZOfE93kZRY
	bYoj2H6A==
X-Received: by 2002:a05:620a:28c8:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7d3f99352ddmr1408749185a.30.1750583456394;
        Sun, 22 Jun 2025 02:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFemKmuVhfNZqZi3jNTGWCvPwZL8XyS98supMIJi7c5F/R/PmLMtgdYfNK8pNsOGmCe2BmodnNYZBj7BvDh5R4=
X-Received: by 2002:a05:620a:28c8:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7d3f99352ddmr1408746885a.30.1750583456040; Sun, 22 Jun 2025
 02:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619010506.296494-1-linux@treblig.org>
In-Reply-To: <20250619010506.296494-1-linux@treblig.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Jun 2025 11:10:45 +0200
X-Gm-Features: AX0GCFsXRVHgDZ0eAGq4GAcg72XA996OFOaZMVswlnXZceqsyE8CU216c6Q7QKM
Message-ID: <CAFEp6-3U2rQEUtntb0cdJeykURocEZQdeVHXFbXXogZV=wxGWg@mail.gmail.com>
Subject: Re: [PATCH] wifi: wcn36xx: Remove unused wcn36xx_smd_update_scan_params
To: linux@treblig.org
Cc: wcn36xx@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: g0nw04sdNbFjaBlsc0lsSCB3CvMGuFi4
X-Proofpoint-ORIG-GUID: g0nw04sdNbFjaBlsc0lsSCB3CvMGuFi4
X-Authority-Analysis: v=2.4 cv=A5RsP7WG c=1 sm=1 tr=0 ts=6857c8a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=3WJfbomfAAAA:8 a=EUspDBNiAAAA:8 a=7_ExDTXYpU6-MgeLbmsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=1cNuO-ABBywtgFSQhe9S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1NSBTYWx0ZWRfXyZ5gGQfj7CHP
 s85tbP5YAZIy5E5zwQEZcbcwk7EJymnM6FLxrYeOKi2oU46IY92z5ldIvf8B+Am1kZh0RdI2pdL
 CV2kknyFlmr9zgGXfRP7yfCa7GFTcRUg+Iidv8mL4hE3dEZow1lewJf0GyT9bvLgLJG6e/FGEXU
 DM7J6qSVl1XCg9hucQ29D1+JDylNkBiTkgWKqAcd2twXdbwS+gxIDbERSXq3V62W9+b1ohYAh9m
 TZTkmCHlvLutSEb/+IeHDI87F9KUsalCG8pIOS1N/rTQfvVABtkTKomTakUM2LT8lRuz9y9knvk
 OCltqKyfz7X69Vp61oSyRnI8HS+8FtPmmmaKtq7iCGwQY0POv76BSwy2aDYZgedyy0CK/gv8fec
 p8hkYk3dKqRxPgb8x0oynqsyCPk1VyGEWEq8XXR4OTn+7nzjOPvEMvp0HsQNCQbj+kERKoJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220055

On Thu, Jun 19, 2025 at 3:05=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> wcn36xx_smd_update_scan_params() last use was removed in 2020 by
> commit 5973a2947430 ("wcn36xx: Fix software-driven scan")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/net/wireless/ath/wcn36xx/smd.c | 60 --------------------------
>  drivers/net/wireless/ath/wcn36xx/smd.h |  1 -
>  2 files changed, 61 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index 2cf86fc3f8fe..136acc414714 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -1127,66 +1127,6 @@ int wcn36xx_smd_process_ptt_msg(struct wcn36xx *wc=
n,
>         return ret;
>  }
>
> -static int wcn36xx_smd_update_scan_params_rsp(void *buf, size_t len)
> -{
> -       struct wcn36xx_hal_update_scan_params_resp *rsp;
> -
> -       rsp =3D buf;
> -
> -       /* Remove the PNO version bit */
> -       rsp->status &=3D (~(WCN36XX_FW_MSG_PNO_VERSION_MASK));
> -
> -       if (WCN36XX_FW_MSG_RESULT_SUCCESS !=3D rsp->status) {
> -               wcn36xx_warn("error response from update scan\n");
> -               return rsp->status;
> -       }
> -
> -       return 0;
> -}
> -
> -int wcn36xx_smd_update_scan_params(struct wcn36xx *wcn,
> -                                  u8 *channels, size_t channel_count)
> -{
> -       struct wcn36xx_hal_update_scan_params_req_ex msg_body;
> -       int ret;
> -
> -       mutex_lock(&wcn->hal_mutex);
> -       INIT_HAL_MSG(msg_body, WCN36XX_HAL_UPDATE_SCAN_PARAM_REQ);
> -
> -       msg_body.dot11d_enabled =3D false;
> -       msg_body.dot11d_resolved =3D true;
> -
> -       msg_body.channel_count =3D channel_count;
> -       memcpy(msg_body.channels, channels, channel_count);
> -       msg_body.active_min_ch_time =3D 60;
> -       msg_body.active_max_ch_time =3D 120;
> -       msg_body.passive_min_ch_time =3D 60;
> -       msg_body.passive_max_ch_time =3D 110;
> -       msg_body.state =3D PHY_SINGLE_CHANNEL_CENTERED;
> -
> -       PREPARE_HAL_BUF(wcn->hal_buf, msg_body);
> -
> -       wcn36xx_dbg(WCN36XX_DBG_HAL,
> -                   "hal update scan params channel_count %d\n",
> -                   msg_body.channel_count);
> -
> -       ret =3D wcn36xx_smd_send_and_wait(wcn, msg_body.header.len);
> -       if (ret) {
> -               wcn36xx_err("Sending hal_update_scan_params failed\n");
> -               goto out;
> -       }
> -       ret =3D wcn36xx_smd_update_scan_params_rsp(wcn->hal_buf,
> -                                                wcn->hal_rsp_len);
> -       if (ret) {
> -               wcn36xx_err("hal_update_scan_params response failed err=
=3D%d\n",
> -                           ret);
> -               goto out;
> -       }
> -out:
> -       mutex_unlock(&wcn->hal_mutex);
> -       return ret;
> -}
> -
>  static int wcn36xx_smd_add_sta_self_rsp(struct wcn36xx *wcn,
>                                         struct ieee80211_vif *vif,
>                                         void *buf,
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.h b/drivers/net/wireles=
s/ath/wcn36xx/smd.h
> index 2c1ed9e570bf..4e39df5589b3 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.h
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.h
> @@ -66,7 +66,6 @@ int wcn36xx_smd_finish_scan(struct wcn36xx *wcn, enum w=
cn36xx_hal_sys_mode mode,
>  int wcn36xx_smd_init_scan(struct wcn36xx *wcn, enum wcn36xx_hal_sys_mode=
 mode,
>                           struct ieee80211_vif *vif);
>
> -int wcn36xx_smd_update_scan_params(struct wcn36xx *wcn, u8 *channels, si=
ze_t channel_count);
>  int wcn36xx_smd_start_hw_scan(struct wcn36xx *wcn, struct ieee80211_vif =
*vif,
>                               struct cfg80211_scan_request *req);
>  int wcn36xx_smd_stop_hw_scan(struct wcn36xx *wcn);
> --
> 2.49.0
>
