Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF21922ED
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744261; cv=none; b=gcgYXKWtBK4CNYM069EJMqxjaG6oKoTdDlnRrylBNr7KyhQXVXzUqYlD2cYoiX9uxwuP9KWeHnBA8YLxDIJ2o9+isxQZthxwWTKtWg/95gT7qv0ME9TJlDoFv9tHwrcBrT60v2fUdLm2tvMYimOlUWOv/AYIFNrq+UpT/8Z+AE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744261; c=relaxed/simple;
	bh=06+bqTZRg6ptyJRvbT7uUPZ5sbC90XpRGa1TPKHK3ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qz5NwdNG+G4epwQkLxCoeeDmsJaHdNeDoesrkei6s1U7Ki2cUnwyDHwOSCBUpEE6PPiLbYbVfsgfnntQUuPML3tvRRIZi8/y39w9k7F4YUc9jojiMwY9Pc7qYjx/PYfAFXzlnkVN5yXsYW9M2ye8YIZQZVSpu4SROIs8dveXM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJS4Cv0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJS4Cv0g"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4tuP5023299
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXBDW4Zj2qm1riop642/edycQKRUKMuQeCUhQ63b6q8=; b=EJS4Cv0giDcYWB+q
	tydSuaxk5wnXQffmNjNIqrEXlhg4UMyIH2J9ITJ66l5kwZrK0FUugWh52w8KoLAp
	z/pbxDaNE4dGHzfyJ4k3w8/nQ3YAkUz1fXUkAi8734kFcaDugo2GLEer42LimKx8
	JXKdFWp1TgbiFT9/3QULIoOGJIkkoov9b4+J8J3sW0aWCoYmI0VR1DimBMPHzXOF
	mvzuzdhFoKmivrbfcyYI5X6uB5syuzxNIerJikZmjNgJeLOQxef7OJqNovaxPaJF
	XSDYEAhq6CLsx2wNr3TWRcM3iwMD9IQkIq1ShleA33w/ElYmOso+kA/y5qQjDoj8
	SbzBhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041v9ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:30:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so4535117a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744257; x=1748349057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXBDW4Zj2qm1riop642/edycQKRUKMuQeCUhQ63b6q8=;
        b=LCOfZcQu6pRKrJ09o1TOamLxlls3UoyRdK1gc9E1jQyg4mRmfjhfXYGUlHaQrEcP5K
         lKQDaqwSRKVvk2jfCWxodZdXd+jfQC7heHsQMaisPUk4Gfwu10N1dNG+qU4THJLS4RHO
         RfMbXfTKL4P1jNSzaYglNM8rpBQoJtQqTJHVes9uW+oEoMzq4/NKa4saLNFW9MF6j/Fj
         tWvovXlpsdRnTMKWTTw0dLlZ69fAe8iVOLHs+iEZYZvBzW36U+x75icZdcJjk1wEBJoy
         AU80eHc4BsJNA0V6+mN3tsHMfguSHPsPYrLaRtyIfHE9iGwnKqByHk60WVQoKe8z80Ab
         a6bg==
X-Forwarded-Encrypted: i=1; AJvYcCVq/CpCfTn1oGw/3oBqzYPh0ErhKc0VqT0jnnya/KSii7ng/ADswgcXjbkn48q/rdioU1b6YmAhVhlWKII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyci4CWQvgGFRqkB/DnolULoCXZRZHyXuYn7bCQttGUvllqiUtD
	fIabJdMIOLtWxwDZvjW7JybB3Uxb9NX73KyMtXEqIXWm2XL5pTXqpM8gxX2K59+O6YTQyLm1V7T
	24OkJFLbP9Hpv8W/QPOJGm2ySyZecFWE+fZ8RM3SAefdXdIoKcNFA5q8EpDFX0Pp5Hkn2vV3V/K
	IrY/SUIcJZfB+166qOE4ad+9k7xX+9ktTU9jCeBVf4Gw==
X-Gm-Gg: ASbGnctCF7DdwGRlEDUlZm0qbpXQnqfyLPvzUBAqrbqIw/9PpTWdTpt6Gcs/FzONxDg
	qVn1nP7A37QVb/LGrJNLiquvlNr0mMc+bV5Mg8zw0xVe1v2MMpIs5274GBOlof1mgNvxGBA==
X-Received: by 2002:a17:90b:5251:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-30e7d542b40mr25042996a91.15.1747744256978;
        Tue, 20 May 2025 05:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7LERFtBGK7AEaAksZZ5SwMMPuSxqQKo8q2KlrpzNtpoBMKejcFG+jY35m4O/WHIROL/D8IyAak0xNsIBjlSM=
X-Received: by 2002:a17:90b:5251:b0:308:5273:4dee with SMTP id
 98e67ed59e1d1-30e7d542b40mr25042930a91.15.1747744256579; Tue, 20 May 2025
 05:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517043942.372315-1-royluo@google.com> <8f023425-3f9b-423c-9459-449d0835c608@linux.intel.com>
 <CAMTwNXB0QLP-b=RmLPtRJo=T_efN_3H4dd5AiMNYrJDXddJkMA@mail.gmail.com> <20250520003201.57f12dff@foxbook>
In-Reply-To: <20250520003201.57f12dff@foxbook>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:00:44 +0530
X-Gm-Features: AX0GCFv2SiJ3q2jRbyIfdSpQtz2ju4Vl5p2bc-eQmtKh68-w0TJPHdu1d6PX364
Message-ID: <CAMTwNXBkAVjwaERAu-UHEHmH-BNe7T3iRfntLw+076g1OWgrPA@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "usb: xhci: Implement xhci_handshake_check_state()
 helper"
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Roy Luo <royluo@google.com>,
        mathias.nyman@intel.com, quic_ugoswami@quicinc.com,
        Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEwMCBTYWx0ZWRfXyDZ0x43vblty
 BqyqNdgEOZZcPVpdrd+ZHGL3y4saM9DwLwlbs7Y66r291NyppL0u3fGBemMSdebjRsT0THWiMxL
 Uudx7xPXjJjj02MvRXrFuTNblNQdWeExHMK5BgUaKgqhvjMkrl5LOIyYCRiViKV/r/YtH6jXTvU
 cmB4xa+kaGQsxm2zIJLRCUrX7QALL5JiDtWGA2WhMzxpWfYU8qysW+72ePfBXjQKmjcH9KmWuu1
 ivD2BWMTfa5bg8mpDxWuVk3fIyONqA4GqfJu+RC1JSZx82xfDp7xG3Tn/FcDJN36IaqG0tKobts
 LXP/RmnFt3LRdQrClWWTAA+0pmxwLxuZPNeThaphfLNe2Dx0de7YERNIX4xY3ivXnRWjRBDMNya
 rP75UhB3Kk2upixGSld1IYTdCJTO3QoOBCa5fGJY/bJ4hTNVqEreYYS8lUZNtUo/Cnn5ZJYW
X-Proofpoint-ORIG-GUID: PqaCwqDmaQJcQQpME6XGSovwW9xT27sm
X-Proofpoint-GUID: PqaCwqDmaQJcQQpME6XGSovwW9xT27sm
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c7602 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=TLaf8UyukAPKd0nM82IA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200100

On Tue, May 20, 2025 at 4:02=E2=80=AFAM Micha=C5=82 Pecio <michal.pecio@gma=
il.com> wrote:
>
> On Mon, 19 May 2025 23:43:21 +0530, Udipto Goswami wrote:
> > Hi Mathias,
> >
> > From what I recall, we saw this issue coming up on our QCOM mobile
> > platforms but it was not consistent. It was only reported in long runs
> > i believe. The most recent instance when I pushed this patch was with
> > platform SM8650, it was a watchdog timeout issue where xhci_reset() ->
> > xhci_handshake() polling read timeout upon xhci remove.
>
> Was it some system-wide watchdog, i.e. unrelated tasks were locking up?
Hi Michal,
Not exactly, I could see the other tasks were not stuck, only the
readl which we do as part of xhci_handshake with a 10 sec timer.
Our watchdog barks out at 10 sec and we saw in that timeframe it
didn't respond i.e the readl_poll_timeout_atomic  was still polling.
Since the timer is exactly aligned to the Watchdog timer here
therefore it crashed.


> It looks similar to that command abort freeze: xhci_resume() calls
> xhci_reset() under xhci->lock, and xhci_handshake() spins for a few
> seconds with the spinlock held. Anything else (workers, IRQs) trying
> to grab the lock will also spin and delay unrelated things.
>
> Not sure why your commit message says "Use this helper in places where
> xhci_handshake is called unlocked and has a long timeout", because you
> end up calling it from two places where the lock is (incorrectly) held.
> That's why adding the early bailout helped, I guess.
>
I think we had re-worded the patch a little, this was my original commit:

"In some situations where xhci removal happens parallel to
xhci_handshake, we enoughter a scenario where the xhci_handshake will
fails because the status does not change the entire duration of
polling. This causes the xhci_handshake to timeout resulting in long
wait which might lead to watchdog timeout." The API  handles command
timeout which may happen upon XHCI stack removal. Check for xhci state
and exit the handshake if xhci is removed.
https://lore.kernel.org/all/20230919085847.8210-1-quic_ugoswami@quicinc.com=
/

But yeah the main motive was to bail out handshake to get around this.

So you could say my main problem was that the CMD_RESET was stuck for
a long time.
In other cases the reset passes in very short amount of time. It was
unusual for this case.

> > Unfortunately I was not able to simulate the scenario for more
> > granular testing and had validated it with long hours stress testing.
>
> Looking at xhci_resume(), it will call xhci_reset() if the controller
> has known bugs (e.g. the RESET_ON_RESUME quirk) or it fails resuming.
>
> I guess you could simulate this case by forcing the quirk with a module
> parameter and adding some extra delay to xhci_handshake(), so you are
> not dependent on the hardware actually failing in any manner.

This would definitely bark, but like I mentioned my case was that the
CMD_RESET didn't exit the poll in the 10 sec.
I'm not sure if that points to the controller stuck at processing
something else?
Please correct me if i'm wrong here.

Thanks,
-Udipto
