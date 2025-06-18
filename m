Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD5827F16C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249592; cv=none; b=U5OA6Pzn6P6oM8RR/lucuiDRT1BUK1wIvAc7fB/R2LJRySYDMYdLnHSlH5g/Nf0yny4z+HBxbxrqxTIVCQVHMz7txj9hSb7bAFyCukAwA0ZkcXAA5bAhz3SxrVJ/oWCOdw4+czYXODz/OQxUtvKz5mLUIhgQdURqGITIr1fAliA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249592; c=relaxed/simple;
	bh=mz0uiMmed9z9tOHShNrfShXtsw2Ac1cxhClTJyFThvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESOGr5yxi/7w4D2bAPPP6FsuKhLg3AwDdiaAFwvUwWe+Y3kUVFwy2JjEekJ1X4y4CClL9N6yg5ujDmVwq9g9Wt/g3gi2bD24D6j4yCj3E9Z4+KcX9KE+hUJCXx5IxWevMi+CPMy64UeRRaFnVtRAf/5gbQMyCYwagwBrRNokars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFCzlY2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFCzlY2A"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAUYb4003294
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bhcW6+q7VLFC3B8HTp/6QcrhI6U7A912t6H6KHU0qA=; b=nFCzlY2Aj9CmiXJK
	vovllZcVekEKXnnJzolwXB8/nfVjjn5EivDPbHazXJENQaUTD9orHGm86wNFTmyb
	Hb7Y/fTUzSGn3CAB+S6cqvSeJMT98z8M/u7lspD4QAI9c6N+14TsPzahR7Xm7yhB
	cg/MWPXpbluhIFLT8P8hZhxIyR/6qQsvEax3bB8XWQ6DGQO2Xe5v5JQvW824Sfz3
	T1NXl9BpInowjvnDb+4IWVxl/iw6rDLBAU+cOW9ELQIPQw/70vucYtItrE27to48
	d1RJ3VTV9eP0az/YtrEiNwhyAIx9iCCPPix87CBTOCwteOHOYie1BEHhKl3buoSU
	b+C3NQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23838p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:26:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f6b829cfso55244085ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249588; x=1750854388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bhcW6+q7VLFC3B8HTp/6QcrhI6U7A912t6H6KHU0qA=;
        b=E1/36ETppsJWaGH0Q1yZcGWE4PSiIRAIwrZCDOAP0sfEPshEjO9LAXb80g0jjgh4c6
         +OCGSKzV903IDwAdPXndOH5TGtP7XJ9txOuLJOj829Z1IVYfvkj2MgCTIQPMV0VShAST
         iXtNy3fF/hBUh50S7JZJ/Sm6KuoTLyTgWRRd1Avngi03b/IJ/t65gIbcZZss3WgMPBFu
         916oTspnBeYL2plJyGlVcRtk0U0S2/IIiIcsC2UFpuK5zp/mJYrHziMQhH9zHqTYCGbs
         dtERaCrMLAY0cLk/WKKGeVeI/hCxmrjp3kkgXOSmt62C7CKJ/3G8QXlMxNImxhbvZC0Q
         /g0g==
X-Forwarded-Encrypted: i=1; AJvYcCWZNyu0+l+r+H57JHaMT2wwkIdgt9Sz1L3X+t3bY6fldinGCicdfp40VqFka+rQflLs0c9eX+gFu/cj7Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCjMpbe1tTnuxZaStLi5Ky4he1MyXlog5p0EkVqa6lnqyOTpgJ
	9eLN5NfYro6OR4i480mVi3f++mjpK0WUZEqZeesPA7uhGexls7LOeGwerBWxDuiMzEhFUFMwd9E
	jhOfpQwFjZugg/+AAvFxo5yUF5m3fQRC+1EEHhGTBN4ky6OudJ3ICeZoNqtgC+hvR2LQ=
X-Gm-Gg: ASbGnctaT8bK+tho/2gPxMZPddAQp6PQ+Ohl9QaOEfiuhbbqV19xzZv9PreNrCsDl0G
	jS431YwkevbgeBAAergr++JjYm4bRb92gQTTp45UjNyZu6R2FetLzA61gEE8nKSdgUxXtUIAHOf
	8FlXLNypU9r7l6eLHGDyFtaw9cgX6CbR928QBEajj8uPL07hZ+Fb6V1JETn+ERmJaStxQG0RZYp
	F0N+mr09QdxKA+Sr3rsyHP/c9QdocyVCCK+7dGJ2C/vbHasH7IJz7ZZ4OoTKo10hBOHrHRo8+Ei
	2p9NkrhIlTQtx7bvThVZOaRa0sZZ4OnGKsDNTQ3uUzwEzbwlRpc=
X-Received: by 2002:a17:902:8bc8:b0:234:a139:120d with SMTP id d9443c01a7336-2366b32e4ebmr156887655ad.7.1750249588183;
        Wed, 18 Jun 2025 05:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcRD1XEJ8bRVvhnDu/jtve9MMGk6I/mHhVF0u4XWlqu8a3OclQos52HAfFvf5CU6P4xFa7yQ==
X-Received: by 2002:a17:902:8bc8:b0:234:a139:120d with SMTP id d9443c01a7336-2366b32e4ebmr156887415ad.7.1750249587820;
        Wed, 18 Jun 2025 05:26:27 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d98sm98727925ad.151.2025.06.18.05.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:26:27 -0700 (PDT)
Message-ID: <8cbc5220-c993-44a1-b361-418b36a3f336@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 17:56:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: gadget: u_serial: Fix race condition in TTY
 wakeup
To: Kuen-Han Tsai <khtsai@google.com>, gregkh@linuxfoundation.org,
        hulianqin@vivo.com, krzysztof.kozlowski@linaro.org, mwalle@kernel.org,
        jirislaby@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250617050844.1848232-1-khtsai@google.com>
 <20250617050844.1848232-2-khtsai@google.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250617050844.1848232-2-khtsai@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qKO4Fdn9XylMxFleZz_FcJb97Wl_EkT8
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6852b075 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=EUspDBNiAAAA:8 a=MIvUBlGXxtpg5XUkedoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNCBTYWx0ZWRfXzn4dfflzt6s4
 ic19xb7p8ZxfbUsw4u7Lh8RNp6pkqEEAiKUfVxPFAE4VP+DAtC44OZhZtVz8fp4ZvtHXlM451wv
 iFmaJhNr4efCNCv3tVA2SDuRM+HoaELK9NYyTfdFv+Q2o4IakW69pLywRD9CNRFHkNHyNdW3fJV
 OLwc5WbISBUitg3bDila71p2if7YqtoL11VNLKQDd2zDWL8FNCuSKbVNcpwQD8PN0tNGmKJiB0Y
 52U19G19JTZHDsNaqw8rATt8mgct7yFXK5G+V1Aj5ITCaydWnI50TmBrp7x3i4HOVXxzbNJBlHQ
 2ZRlaDohYiruCMjaQGXbW+dK5ZzQZDUhKgjcxfX7dPhevMzVxdKszj2JOpB8AYJ2zyFKQXMVUIK
 VpJuuA9zYubbQNayaMhDS4LCHvjCwCK4c3gHWcGquWQc4A9d7PPpLXLPJs7/X79loAMIPTGe
X-Proofpoint-GUID: qKO4Fdn9XylMxFleZz_FcJb97Wl_EkT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=888 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180104



On 6/17/2025 10:37 AM, Kuen-Han Tsai wrote:
> A race condition occurs when gs_start_io() calls either gs_start_rx() or
> gs_start_tx(), as those functions briefly drop the port_lock for
> usb_ep_queue(). This allows gs_close() and gserial_disconnect() to clear
> port.tty and port_usb, respectively.
> 
> Use the null-safe TTY Port helper function to wake up TTY.
> 
> Example
>   CPU1:			      CPU2:
>   gserial_connect() // lock
>   			      gs_close() // await lock
>   gs_start_rx()     // unlock
>   usb_ep_queue()
>   			      gs_close() // lock, reset port.tty and unlock
>   gs_start_rx()     // lock
>   tty_wakeup()      // NPE
> 
> Fixes: 35f95fd7f234 ("TTY: usb/u_serial, use tty from tty_port")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---

Reviewed-by: Prashanth K <prashanth.k@oss.qualcomm.com>

> v2:
> - Move the example up to the changelog
> 
> Traces:
> [   51.494375][  T278] ttyGS1: shutdown
> [   51.494817][  T269] android_work: sent uevent USB_STATE=DISCONNECTED
> [   52.115792][ T1508] usb: [dm_bind] generic ttyGS1: super speed IN/ep1in OUT/ep1out
> [   52.516288][ T1026] android_work: sent uevent USB_STATE=CONNECTED
> [   52.551667][ T1533] gserial_connect: start ttyGS1
> [   52.565634][ T1533] [khtsai] enter gs_start_io, ttyGS1, port->port.tty=0000000046bd4060
> [   52.565671][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
> [   52.591552][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
> [   52.619901][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
> [   52.638659][ T1325] [khtsai] gs_close, lock port ttyGS1
> [   52.656842][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) ...
> [   52.683005][ T1325] [khtsai] gs_close, clear ttyGS1
> [   52.683007][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) done!
> [   52.708643][ T1325] [khtsai] gs_close, unlock port ttyGS1
> [   52.747592][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
> [   52.747616][ T1533] [khtsai] gs_start_io, ttyGS1, going to call tty_wakeup(), port->port.tty=0000000000000000
> [   52.747629][ T1533] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001f8
> ---
>  drivers/usb/gadget/function/u_serial.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index c043bdc30d8a..540dc5ab96fc 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -295,8 +295,8 @@ __acquires(&port->port_lock)
>  			break;
>  	}
> 
> -	if (do_tty_wake && port->port.tty)
> -		tty_wakeup(port->port.tty);
> +	if (do_tty_wake)
> +		tty_port_tty_wakeup(&port->port);
>  	return status;
>  }
> 
> @@ -574,7 +574,7 @@ static int gs_start_io(struct gs_port *port)
>  		gs_start_tx(port);
>  		/* Unblock any pending writes into our circular buffer, in case
>  		 * we didn't in gs_start_tx() */
> -		tty_wakeup(port->port.tty);

Just curious, since this is already under lock, checking for
port->port.tty would have also helped, right? Anyways looks like
tty_port_tty_wakeup is better.

> +		tty_port_tty_wakeup(&port->port);
>  	} else {
>  		/* Free reqs only if we are still connected */
>  		if (port->port_usb) {
> --
> 2.50.0.rc2.692.g299adb8693-goog
> 
