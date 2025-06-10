Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1324397A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576267; cv=none; b=Wzi52DmUNOG7v2YjlI5RoeuJPRUxVNURFUpUIRQbHVE+llaN0EPnVh2edPrkL6j7gcEyjlC8gLrD2j+ANpGNe+nUY3/+0zaX0AfuVkzGKn4HFXogMHYVwntMuZLueJ06InGWXc4j2oZE7LQ6G6ZLQHCFnz5i55fECoi3I8QpTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576267; c=relaxed/simple;
	bh=vZ/qHJY5SYbx69O6TGT6pJN0oltt/Iwo/nwAfXXgjo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gtk2/TYSb3K/O2OWD61pVi6vCwy+Mmp3EZqbhKkAskDOtXnvk7J9JwDMgQJg5FZZtfTXY4f65pZ5vAXPRwaRVJeTkdAtpqKfYVS81I2v45slQ4g4ppKnSPy124WFj6Vs9cBeqsWnOVe/eJ79FR6E4f6UJz5hRlYd84lLGFcAEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR26CCm7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR26CCm7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AGtHRB017891
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EgCdyUGamjcRnI5Pix4QyBB
	IiE0+ID5FfFUhMmjiF4=; b=cR26CCm7BHCRgyaBrtjlhw72O2tcLzAg7zeNrvSw
	7rf59uF/gNJJ06WPbea6Q+VFkDj0pHcRKaCWyVo/wdoWSs27nTpP67JwUAz+ZgPM
	TwmwnvV+gJNFFZj2o9+zDIzx/hQry+CbYDCKU/G/fm0UxikQEjzxJATUHlXZ+FWF
	2kyV6XtYKtbKoPETiygC03CEOFkFi/1vdxUEJ+MVx5MNm3VPrGgAzlgN6hdlAj4M
	WRzauIusS85csVP/pr3oRVZcAGS2Qy/1TX2KYm3fBFJnG2M9ycMhxm2XhfJuCSrN
	nfYJh4oqz3KItwSwGLgikVHwmk2qn8hXbj02+71wFjYApw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mck0j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:24:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso904466585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576262; x=1750181062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EgCdyUGamjcRnI5Pix4QyBBIiE0+ID5FfFUhMmjiF4=;
        b=M+gRrbsmskonFDFGswQpGDDabLzOHzJq3bp2gvdYySlxJG8pYt67u1+6MaAyhXau3h
         8IiLcXb5QSysTIgKqQE4RS3YXmPjUZacjsvu1R4JXUJJEzEw0h3Lpq3njCGf+wGRs6H+
         lK0KUjpyOHTWrzGaNkWhKF9X9TNctl9eJfNhvuv2VZNNbb0TfjPvXGTwXI5hf0icxcs2
         8pZEz9tSO4vqjOisFyxJPfjHRcmbosuaE7KhyFcICDox2ErmUhrJCEk8vC1jTg4+hTkH
         OQm/UUJBnUpwKMtbK1vdruqYNIKiIHcLExEWjvAJkwqrNCptbfLx3JckFYdwXH5GWZ31
         mgdg==
X-Forwarded-Encrypted: i=1; AJvYcCUPHOJHJovXrC4Ev84vUsJXxmiw3tUqT1apsF8p1wCtLqCL/N0pfcUKK/SjYl1gdCBFQynPtDsaktvP7pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWRROa8ePOjTh2aKgqGIm+OeOs5coHt+bgf+8kyOdya7Atawmz
	bv0iDUDrXI5j9YHhGueQpYgrJdfyoOwyhq2/Diji/f/tNyQaywMrfMpoEwDe9NWM4PFO8IzYiZY
	DEzEkqW05Zry5hVxELsYfSMfHyg3YjWpytci1M0A0AJYwfCyLct7EcL89sXoXjvy7/Ug=
X-Gm-Gg: ASbGnct+vhKMoISxA6MSEvlpNJX0IVI5W3SKkAlhFhOgFf7JoUafSOwuXI3zaXNj0nH
	GPhPiqI3eA9OcVsFXFXTyePMLHDJ/s2WGPnXNKVQzM07rPXywlOx1F/w3vZBi/83TvKFsC5ncML
	y7ggCOoRFzn+zwduRypfAEwUZfKDIIuivgmeGRp5bt8a2QN1y2LLjuOnSF1EX1D3suYT3B4d0ip
	slhVd3s2kk/J4OJFHpmGh0gtaHiUQzMLFOhf/kLbB7j89v2ztCrMjP+CKNjlBfPsIHK6b+8cHzp
	rCPm5klQeiop9gfLeqVfIr42Xksn6PhjhPCbgMqSgrAU/9ffesOFyvxc2HGHQE+5XNvkpX0XoNi
	sCAESvaFc2tzR5dg8tD3dnWQCwlLxusguEBM=
X-Received: by 2002:a05:620a:3192:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3a8819d38mr34794785a.13.1749576262229;
        Tue, 10 Jun 2025 10:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJwAL23sxfBB/KttW8whRTTbhx5/KJQNW3ngwPR3f5kgUdwtLnj09kuUoauwaIYW7FJDmPZw==
X-Received: by 2002:a05:620a:3192:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3a8819d38mr34791585a.13.1749576261848;
        Tue, 10 Jun 2025 10:24:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733156sm1622634e87.243.2025.06.10.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:24:20 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:24:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Message-ID: <5pbdk3xo6jkj7gwxlgvzdz4nxehjm6izgejjvwafxitvn6lm5p@qhjfezk3dvdh>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250610110047.4yc6zjcvkobxerml@umbar.lan>
 <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68486a47 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yhNm8lLqjQGDdp7WpVgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bKvtnCOHUODOl3Rtr3rGBic7H5457FDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0MSBTYWx0ZWRfX/etDCJiEQEO1
 uHTID0dEVrJoV3XiIMW8kXvwBCVFReQyHiK4fexjy+cNbNUrA6MoZG12nFa16DYZJkQoD12ZVOB
 Z7uSb0b3MQtyNSTCEpzswdIQKSlCk9Acm6TlBsvEck17GbOVwUlQweu9PIYlvUQypS7Ju3Lt0/k
 W0l8wGSTPW5jTp7UKEgvqChXDWstny3+ApJGGY5H3+Kla+lt20sYSOuEdzfvPbSEdZxSFTXjArh
 45hWwsSd8TIEsEVztO6ZvPddk59ER6JCCW9yPESNolE6Ciapz4hDddX9pbf0X7NP08ecUTk5w7I
 1AZu7qsWKc/wL+XH1FJWlEjb3lfthp0YB8r8Xdi1a3ZV7kQnbKIshQpJnJaxbOt412E2ZQPMspA
 H7+9/zkepEe2ILNwd3xDN4H+md5OdCyIAbzrHYgUstbg4+z1F1p5jJJ767oxWsR7+Mw+Ug8p
X-Proofpoint-GUID: bKvtnCOHUODOl3Rtr3rGBic7H5457FDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100141

On Tue, Jun 10, 2025 at 10:10:33PM +0530, Krishna Kurapati wrote:
> 
> 
> On 6/10/2025 4:30 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
> > > When in host mode, it is intended that the controller goes to suspend
> > > state to save power and wait for interrupts from connected peripheral
> > > to wake it up. This is particularly used in cases where a HID or Audio
> > > device is connected. In such scenarios, the usb controller can enter
> > > auto suspend and resume action after getting interrupts from the
> > > connected device.
> > > 
> > > Allow autosuspend for and xhci device and allow userspace to decide
> > > whether to enable this functionality.
> > > 
> > > a) Register to usb-core notifications in set_role vendor callback to
> > > identify when root hubs are being created. Configure them to
> > > use_autosuspend.
> > > 
> > > b) Identify usb core notifications where the HCD is being added and
> > > enable autosuspend for that particular xhci device.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
> > >   1 file changed, 56 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index d40b52e2ba01..17bbd5a06c08 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -95,6 +95,8 @@ struct dwc3_qcom {
> > >   	 * internally by mutex lock.
> > >   	 */
> > >   	enum usb_role		current_role;
> > > +
> > > +	struct notifier_block	xhci_nb;
> > >   };
> > >   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> > > @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
> > >   	return 0;
> > >   }
> > > +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
> > > +				    unsigned long event, void *ptr)
> > > +{
> > > +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
> > > +	struct dwc3	  *dwc	= &qcom->dwc;
> > > +	struct usb_bus	  *ubus	= ptr;
> > > +	struct usb_hcd	  *hcd;
> > > +
> > > +	if (!dwc->xhci)
> > > +		goto done;
> > > +
> > > +	hcd = platform_get_drvdata(dwc->xhci);
> > > +	if (!hcd)
> > > +		goto done;
> > > +
> > > +	if (event != USB_BUS_ADD)
> > > +		goto done;
> > > +
> > > +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
> > > +		goto done;
> > > +
> > > +	if (event == USB_BUS_ADD) {
> > > +		/*
> > > +		 * Identify instant of creation of primary hcd and
> > > +		 * mark xhci as autosuspend capable at this point.
> > > +		 */
> > > +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
> > 
> > This feels like an overkill, using notifiers to set autosuspend flag.
> > Please extend platform data and/or other static code in order to set the
> > flag on the created xHCI devices.
> > 
> 
> Do you mean modifying pdev of xhci from dwc3/host.c ? Or adding the
> use_autosuspend call in xhci-plat.c ?

The latter one.

> 
> I thought adding this notifier would be a better way to identify when the
> xhci probe is in progress instead of touching pdev of xhci device from dwc3
> layer.
> 
> Regards,
> Krishna,

-- 
With best wishes
Dmitry
