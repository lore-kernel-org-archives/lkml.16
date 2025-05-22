Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913B2356C9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904145; cv=none; b=UiT4YauqiPcy1ob3qs5OruolSvynn/Epli6J7rhkeHz0BEv5fkKbdoFA8uFK6Lwr/zShUP7yjqzZQG6mrubrhcZgpbU+epgscPMVjiW6auvPkZKCz6Z4bumiGzlSWwGzOz63qcbEX8CNpbqkvXAnLEZs19bw0bPlKAmIiR0dIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904145; c=relaxed/simple;
	bh=UtHCmMjOpCa1FgqhzPcsESv86QWjhGltJAqaoUfN68Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewnXnXiEDJe10RquDf7lzbdoQMI7PR2osS+vRhPCxSMFKJ+Cp9SeltklfVi50+kMC2jHAWhHHnIhfBqu3N7wXQjtBFVaeiAPiW1Ter9gAV74+O+0kW7duxchIdxabVmVHgJtObJQ+cHPxHwOp+aleTDKylN/QmjFhgxYcYhsbCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFroLtWK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFroLtWK"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso7604214b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747904143; x=1748508943; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnv34DyLz2EhtSWIQDuMJvaAtqi0gnS9aObV/nmCyco=;
        b=OFroLtWKtKYmOm8H0Qro8YV0XLT2M5fIBJn/PSE3cFdZX9GpW/HZraEaoVUcjShGH0
         nS2Jy9vgHUi5Ij9aV6u8aDLo40JzKHytnlX1OeXeAy4TXZJi/wBfSHmJfspRXOp9h4go
         WbOfTgTa0a8iZT6v9fhgv9UqjGIZiokSLRU5pbtne9+u2QyqlfV5WWPFpigaoaOHP1A1
         mZrjmNZKwf/UWtG+KVR7KXF039hvUTW4q6O+K7gMjXfM+Kg2u5PW95heSbrYEfSF+ujw
         r1rQ9kFFdc0/VavmFj2MwdibfyfCjoKbMJ/6Hn1Qd9D+qUDpRBsnpwyxavQVUa2wsYMA
         7BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747904143; x=1748508943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnv34DyLz2EhtSWIQDuMJvaAtqi0gnS9aObV/nmCyco=;
        b=Hses5neVXhVMsJSzeSAV/hOkB1dE127nn4ie5dYExPzFHTZAr10WBgICKtlb5VF8b2
         kSWCiSUlWTK0xwanzYRt3aJdKBNxM+mTV5as/k1SmoGiUI2ZrCdu+wEAEciaYYwOXpiD
         gYu88A8mdUWrH6PHNyS73s0K1drXyN0+fyUZgP8C+8nMI0oI3GMQNEzMkvS3qno5Gkb2
         KZvUc/ddrdgGDCDAmAMXVn88nqMC9oz9fQx9GmRIwyaKMrSRbr6N7rnuNpAhTFuIGTF1
         QEzhgNbZgI5R37yYhpx04HUxQQ2y+z5EZ5sbXgfF9Wum/okziUvudKjBvGkew8sw6TpK
         cNjw==
X-Forwarded-Encrypted: i=1; AJvYcCX/pLGaDSl0Ky4ZbdfobFNKLzox2tfq3uUw8ZEzamI2HyxSiPthnojNt9CJLb3AGzaBeP0T2WRNP6fjcoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYz2Q7PUnFUO2Tw+H4a9GRbxlyuStNUcxJVduGgeQQMLYXiuTx
	RM8s3gosixUm2fjDofsDx390DdvEWDuFLiA+FBi1MqN+oqdYN+AABh89N9D7hsG7Xg==
X-Gm-Gg: ASbGncsMh00N5k2IxhLwQR7XSwbPkg/XLGWOWXcdOkxNNkfdo7tWy3FKebHK34/yXlf
	hyKkBPQ3v4oi4lT0HJWeJnSEdz56volTN+XgJBStWyZEB1tqnX1DIraJZH/FWUSLNj+biDvZ77t
	OpKhGItI7lt3YKIE8FsWMDUYAsd66Das4xNcIh7OoY6XW5OcRYgY+BE72527FblzUZg0LkPCi5t
	eb7WWOzhanHbHOuaGQpPFuSM6eAdzHZoIGxWQW2WC5wI9L/3LwLCQ1MeVq/wUIOWsMV5qOipVRO
	BRVSZkMLCUq4rFW7zN0EzD4PSZRkt+5INzXpPMvBEaecTxHsOkcZRtlWKvEailEIHWEQSPqK
X-Google-Smtp-Source: AGHT+IHq3Bbf8nhBuJ8dc/yRE+e5Su3YtKEAGVHhkTBz5QbJAhFT2+T/UfMA09WAkSzGhja7TXZJcQ==
X-Received: by 2002:a05:6a20:7f8d:b0:206:a9bd:ad7b with SMTP id adf61e73a8af0-2162188cce3mr31661968637.7.1747904143010;
        Thu, 22 May 2025 01:55:43 -0700 (PDT)
Received: from thinkpad ([120.60.130.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8db5csm10851412a12.34.2025.05.22.01.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:55:42 -0700 (PDT)
Date: Thu, 22 May 2025 14:25:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 09/11] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
Message-ID: <5z5yfa2xrnkrgz6ol6baaynsy4vugxv3kf7c2xrqjqvrr7dbcr@u3qycb4ucguz>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-10-quic_nitirawa@quicinc.com>
 <knlhbl3mwo3b7xc4rjp4y7yka2nwythumjacmvn236v72ykddo@r3cp2w4uomol>
 <5584c019-d435-4d1b-b38c-80fb9b9f00f6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5584c019-d435-4d1b-b38c-80fb9b9f00f6@quicinc.com>

On Thu, May 22, 2025 at 03:10:48AM +0530, Nitin Rawat wrote:
> 
> 
> On 5/21/2025 7:27 PM, Manivannan Sadhasivam wrote:
> > On Thu, May 15, 2025 at 09:57:20PM +0530, Nitin Rawat wrote:
> > > Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
> > > phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
> > 
> > s/removes/moved
> 
> Sure, will address in next patchset.
> 
> > 
> > > to suspend/resume func.
> > > 
> > > To have a better power saving, remove the phy_power_on/off calls from
> > > resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
> > > PHY regulators & clks can be turned on/off along with UFS's clocks.
> > > 
> > > Since phy phy_power_on is separated out from phy calibrate, make
> > > separate calls to phy_power_on and phy_calibrate calls from ufs qcom
> > > driver.
> > > 
> > 
> > This patch is not calling phy_calibrate().
> 
> updated commit text to remove phy_Calibrate from commit text
> 
> > 
> > > Co-developed-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > ---
> > >   drivers/ufs/host/ufs-qcom.c | 61 ++++++++++++++++++-------------------
> > >   1 file changed, 29 insertions(+), 32 deletions(-)
> > > 
> > 
> > [...]
> > 
> > >   static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
> > >   				 enum ufs_notify_change_status status)
> > >   {
> > >   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > +	struct phy *phy = host->generic_phy;
> > > +	int err;
> > >   	/*
> > >   	 * In case ufs_qcom_init() is not yet done, simply ignore.
> > > @@ -1157,10 +1141,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
> > >   				/* disable device ref_clk */
> > >   				ufs_qcom_dev_ref_clk_ctrl(host, false);
> > >   			}
> > > +
> > > +			err = phy_power_off(phy);
> > > +			if (err) {
> > > +				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
> > > +				return err;
> > > +			}
> > >   		}
> > >   		break;
> > >   	case POST_CHANGE:
> > >   		if (on) {
> > > +			err = phy_power_on(phy);
> > > +			if (err) {
> > > +				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
> > > +				return err;
> > > +			}
> > > +
> > >   			/* enable the device ref clock for HS mode*/
> > >   			if (ufshcd_is_hs_mode(&hba->pwr_info))
> > >   				ufs_qcom_dev_ref_clk_ctrl(host, true);
> > > @@ -1343,9 +1339,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> > >   static void ufs_qcom_exit(struct ufs_hba *hba)
> > >   {
> > >   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > +	struct phy *phy = host->generic_phy;
> > >   	ufs_qcom_disable_lane_clks(host);
> > > -	phy_power_off(host->generic_phy);
> > > +	phy_power_off(phy);
> > 
> > This change is not at all needed.
> 
> In the current code, PHY resources (clocks and rails) remain active even
> when the link is in a hibernate state and all controller clocks are off.
> This results in a significant power penalty and can prevent CX power
> collapse.
> 
> These rails and clocks are only turned off when a system suspend is
> triggered, and even then, only at SPM level 5 where the link is turned off.
> This approach is not power-efficient.
> 
> As part of this series, the code that enables/disables the PHY's regulators
> and clocks is now confined to the phy_power_on and phy_power_off calls, with
> the rest moved to the calibration phase.
> 
> Therefore, we are invoking the phy_power_off and phy_power_on calls from
> ufs_qcom_setup_clocks, ensuring that the PHY's regulators and clocks can be
> turned on/off along with the UFS clocks, thereby achieving power savings.
> 
> Therefore, this patch is the cornerstone of this series.
> 

I did not question the patch, but just the change that you did in the
ufs_qcom_exit() function. You added a local variable for 'host->generic_phy',
which is not related to this patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
