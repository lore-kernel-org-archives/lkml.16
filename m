Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCC2EE289
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249708; cv=none; b=KDPYBNTEdnzz0V74HC+QjE1cgAKLZu5YEbDHgyjWQaA6tRxuXjiwUTNnDj3/H7W+WczJP2MNjIo5eU8Tz0p5fDOR8+VDMTdCADW1Phk+5RnK/Pw2CJjb0QNq3ldTgb430vcuvqqZ+k2iyh3/ggpCilx0df6N6Y6fauGk4b1T16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249708; c=relaxed/simple;
	bh=SGGHR1NqClMJ+M0KMBTSpiEtbyInmggJO689JFl72EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNFMspJVimBacQLGbUUX/yMVjPVrFeqG+Wdp01OHIfq5gZ4hwoRhgcb4HNkQwGzcChVXULGm8dSHtbUDp3ZxNA7TUwhBVTUPhdaGw90Yh9uy9CdorYaHzkmow3cQtyeDGYeYr7CiVLJ+TE7TzKVb0wRx9oYnwc0cjsuV14ypNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZPG4WKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZPG4WKA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IB0ZD0003284
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6xOgbRbrA02R3HdzmsRIbjOdD2Sg37CCZtJoQqYbhk=; b=MZPG4WKAV0kt7XDj
	quCCDZ8Wo/h02Nrvsnn0wdVIbIyNcQxmq6/vzaxOohmASW0V3ugYzTvMB1xgfdW7
	cTgUrpNYqWQvils8cdFpl0TaC10qOCjJYhm71e+O0PYquvFC8pjGOZ09S3lra0xS
	eVSiRM2D32M1fT9a3Emhd/QvSjMjk2TTC5DXYNErB3W+9huUeSKJc9oHbuFzMjQS
	8pzKNbjjSGPIeAvXhwO/J9Ex63p5bv31W07F2EPnKmviK485bmj0duAFrGvdaCyu
	tuNXd0tZwE1S82ldLvv0bBfAqePg3l3Q0jgkk6tH+Yf3xXZ7Y8uJCOVZDFKpO++Q
	aQMn8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2383mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311e7337f26so5233115a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249702; x=1750854502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6xOgbRbrA02R3HdzmsRIbjOdD2Sg37CCZtJoQqYbhk=;
        b=EUUptSlkRkfbiYPqWJ7tzkhUT5ksb9pEYfhHVtPf2s4ECAfq9vKIKYmrNCJARK3H5e
         InHkQXoyUggeOEaXlmytcwAK/xELkDI6m/UIAtw2HYl6riVktcm5pzQ+U3Vu/7tHmOkj
         yfeuMQTu+JHPVy8PmjkTeXf1q1rY7ROUSiwxmdO0mCviVQ0b0NWHu/hIcxuBpaJWmDRc
         9pLnouk/CTS15qS1gVItZWB7l587JOcPZnHX5tdmBc8trq+fyARKnxCFITd46ZnGoB7g
         KP+E/oc+n933NnEST+csEvGRHbjqJXHCuOz2PfAqGjiPQuLQ1TDylZLusl/5ryG4P7sC
         x+sw==
X-Forwarded-Encrypted: i=1; AJvYcCWw/AEvl/3EONdvuwvtMY+vuR907a6aEi+vmkdMPF4Ur8pl9swrUxXf0d7ulUfhBxgYfYkJkLw15Cvv9es=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLkYkHKcRZkBQGQkkZ1qKBb1jvpZ8I+Zny79lfQsKStG5Kf5d
	BXV0nkIFRz8T7K70FHy9QST7O3xLoCOMRsuivM2O2Y07NAnUhF0/iiGmrbOKyL6uiiune4C5/0c
	jy4xKbfpudEcPVgVasmnabL0GL4ItsQoGQdKtHTPdqqsiilMT8lsi0I3L6FZSVSjoGYA=
X-Gm-Gg: ASbGncuEcUwABpAvtRh9gVfvp3zaNKETaPfKBqYcKsWXgc7j9RAqyjHXBPsol2nTXVw
	Y5gvVBs5Qt0PJ1f0Iyzn6dncAR73tUybmBy8qUbjYdO5qsuVLHvRBycOyizfB740ddrBrH3f+Yw
	f3zWv35gPUrlpTyMS9z3CJcPx6mMbw6q122U6wsMC4AuwnCpgsGlLbJ9PsfOV2jSQhHHXQ+rI1Q
	TyvEbr2xMZk9qzsDjBQKYY8FA2H+vSVkAdSZh+ZMSW1OeqTflcqCy9vCEDk4vV1CyPyztzFobzb
	7esq2WrYahQ5FfAM+GnROuIHv3MLlHQPS44MGu42+TF17E8ke90=
X-Received: by 2002:a17:90b:3c48:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-313f1be19abmr24396520a91.6.1750249702459;
        Wed, 18 Jun 2025 05:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0s0iFtkw1AOj/1npoQmPFdLviiscI3pzr93fmguRPHGKNJ3kN5JB6C41oFBZfgOjZSxk+9g==
X-Received: by 2002:a17:90b:3c48:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-313f1be19abmr24396472a91.6.1750249701999;
        Wed, 18 Jun 2025 05:28:21 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bd9ae1sm14159310a91.18.2025.06.18.05.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:28:21 -0700 (PDT)
Message-ID: <2fadb854-f838-44c9-968e-96f0c00f4d3e@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 17:58:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Revert "usb: gadget: u_serial: Add null pointer
 check in gs_start_io"
To: Kuen-Han Tsai <khtsai@google.com>, gregkh@linuxfoundation.org,
        hulianqin@vivo.com, krzysztof.kozlowski@linaro.org, mwalle@kernel.org,
        jirislaby@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617050844.1848232-1-khtsai@google.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250617050844.1848232-1-khtsai@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QBxp66C51-PtTJ3sgQlVRQapDj17RRhs
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6852b0e7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=-OAJHiNwx6N_JZPXFJwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNCBTYWx0ZWRfX4D4mvcUrPvgH
 ptqzsy2HPBrnFL95oqIXYxbHLuh/0tojNZwggiZFgK7QwKasFX0AHwsITkJkHdFAux1XpvVMArS
 tNroCG/6Fi5S4A6o8B4k8wtUmJF5ob7AaYvUQf2sTa0zer6tymYuoUd+6d0sWYjiMBpnFB1x2Nh
 dRulM5KhlH7oFKTEaYRaMpNaJP1nX9krUTSC4BKcgVSFEJcmY41/Y7ugERYU4YYer2QHYuz52US
 jNzc/HBElNHyo5fml5YJCKgvRARKE9VZbbqTBptg/ZL7ZNt3G4GLLehO3y1ZwksDmvgOjAeq3fD
 g8qMAjb5V2XLv9J6PpStP+LNfS8W70HqaKDiqU+4JjXLwFrzW1viDxmo/l3Hf9OEo+EUQmld1+T
 oW59KlAHlLZYJabOG6Gdz2E6LVSNd96C3HkDTr43UL6iUzwH01ye2yc6HrQO5bbSZYCCWVip
X-Proofpoint-GUID: QBxp66C51-PtTJ3sgQlVRQapDj17RRhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=615 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180104



On 6/17/2025 10:37 AM, Kuen-Han Tsai wrote:
> This reverts commit ffd603f214237e250271162a5b325c6199a65382.
> 
> Commit ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in
> gs_start_io") adds null pointer checks at the beginning of the
> gs_start_io() function to prevent a null pointer dereference. However,
> these checks are redundant because the function's comment already
> requires callers to hold the port_lock and ensure port.tty and port_usb
> are not null. All existing callers already follow these rules.
> 
> The true cause of the null pointer dereference is a race condition. When
> gs_start_io() calls either gs_start_rx() or gs_start_tx(), the port_lock
> is temporarily released for usb_ep_queue(). This allows port.tty and
> port_usb to be cleared.
> 
> Fixes: ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in gs_start_io")
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---

Reviewed-by: Prashanth K <prashanth.k@oss.qualcomm.com>

> v2:
> - Remove Cc: stable
> 
> ---
>  drivers/usb/gadget/function/u_serial.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index ab544f6824be..c043bdc30d8a 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -544,20 +544,16 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
>  static int gs_start_io(struct gs_port *port)
>  {
>  	struct list_head	*head = &port->read_pool;
> -	struct usb_ep		*ep;
> +	struct usb_ep		*ep = port->port_usb->out;
>  	int			status;
>  	unsigned		started;
> 
> -	if (!port->port_usb || !port->port.tty)
> -		return -EIO;
> -
>  	/* Allocate RX and TX I/O buffers.  We can't easily do this much
>  	 * earlier (with GFP_KERNEL) because the requests are coupled to
>  	 * endpoints, as are the packet sizes we'll be using.  Different
>  	 * configurations may use different endpoints with a given port;
>  	 * and high speed vs full speed changes packet sizes too.
>  	 */
> -	ep = port->port_usb->out;
>  	status = gs_alloc_requests(ep, head, gs_read_complete,
>  		&port->read_allocated);
>  	if (status)
> --
> 2.50.0.rc2.692.g299adb8693-goog
> 

