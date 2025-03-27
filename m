Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7E819DFA7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093382; cv=none; b=oN9ZyUmxV5t0uNEkopCZMD6+GR4uXkQUPqHaA5oO51/Ymy79IoLISjcmZ83ay3JDbnaGJZTSeQRln9noXTFEiIJxaQX3x+wg2+3aWm8SXSDN5hZNOp3i6AVHVq2KhRpwYn5LoLPFvDrkjp23d6+e84anrN4DQ3eM3TdfZR+IkiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093382; c=relaxed/simple;
	bh=r74tUNBWnS54DNQaW+6dGohKu7XZ7LEJUlyCmBwJkiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKV6FWxTsfKx2PapfC1/nveLMoWaLMGzLgaGz2xEIogguHnrikd9uXZLrazMYJJ9pjtjmgVqiO39+S8K6JjIg0WHH0wbzvfuuSN16BIC8VklbQdUlloAG2o4pAw62mAslWi7rQiplBfXDL/kvWptP+DujM4/r5ObomFyRqGI/nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTCyRS7e; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTCyRS7e"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso2147232a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743093380; x=1743698180; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTm3yeZQu7nnkYYIrtIiav2KcYikzBu4G9HTZHFQyuU=;
        b=gTCyRS7ei7JQ2OjIkmdhNcnIfSwhlY9ox9rCZkYY5WZDBpk8Lq0lfeJjaExRQpWT55
         uV5aaYUM9tM5uaAAByVbopL9naUB1Gt3mvqghvxLdQ0ea/sTDPyoeUMsY9j732oJUBDH
         AKSP3zEzQPbXHkQDwz3Pw2yI/UhBgCi2Qk1/SWJl6SvM+sjTpBlT7BZA+0XuuVxSaL+U
         ar/9cQB6qzNJ/yIwhkoo7ON+zf2t9Ksynn6v2RxgZ7tP9WxDBRG55pqRAGITyQfW6u/8
         VYyzqS3iQuN8cM38Z80eLpwhHZMhEway4NNe05+yZ2cz0gE7fO7jn1+tEFbvc9nUTOzA
         WdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093380; x=1743698180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTm3yeZQu7nnkYYIrtIiav2KcYikzBu4G9HTZHFQyuU=;
        b=Kk98zfn/C+SGh8IIdkksIcoz9vPE/1DJ291UaheBS9BQ7nJoIcbgqsHsDfLqnCwKqh
         lVT1+pGBNjd2EsSd2/73Y6QYKgA+7udy/1YWO3ucgFqNqF985LZ2w6wlsD+71oSEL80+
         yUJUF4EDAHpRaLwyH4jLpoxcGf2B20Z5y+gH8AaudPrU+v63JG6GscUmfffIwREvy0AA
         MwFFQ3mMZLbqn+GdGlGI4XiXA/s5YGgItn9kvegqZgZWsYeGF4IF4BorwuNh6JHVXgaa
         ZlGR30ErzfzzCzEalQX+xJlIYcLSxehz19I5pYpOqxozSXDnBbzYZmzvHNgqpUyz2hku
         MJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyxInIwflloReXYBLeJtyZFnxOZIOHRDPwcOmuMT+qdfRomH3CrxhdDaFYmcllRTyKBRU+taVx4DDlKuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5IyhQFMtWzFkmC5Gj5CTbqW3D+JTpnPsFfEPLaWxUUcCVOD+d
	Yh9o9vAcS5eSVSZa10TlVbY51Z6/8/COgzXLySy/bX+09vakOV2di9LPPEVCDPzi8uSTsG66He0
	=
X-Gm-Gg: ASbGncs5ImCM+Ar+v54J81Gsjo7H1LLRCxQ2fKisU+ohpZP95zKIweORmly1r2iMUpy
	5QwwSjGuVEEYg1RpvOlglDVd3oys6Bf0g0OU2XD7A+L1fi6ldwmFylJSX72zYFXaUjYDTER+2Y2
	qWLm65forL4CT4r0Sj/0SqwGlVd5Lrq8FrxO+9Ru2DjvyiTGMSvhe0IYDbJf3wsbx4drOp+ZAsM
	fofFa+1BEQTMi2PJ0vL7HyHKL+CEnI61/BTKfrWlNDDP6uRuhgliqzNHYtm5uwIOnLGnR9MUQhd
	Wtx8Ucz8kgQZ4CM/sSUPXLbIVzyIK8X2lsG2nn/Rwzo75FIlr4kZYVI=
X-Google-Smtp-Source: AGHT+IEQCE5jfk4erv9qH3E6newI4gRsYwZh/PGLh7gYIR8Yt8v0Ie/q6zezMo/vtBrKuenQovT8cA==
X-Received: by 2002:a17:90b:2dd2:b0:2ff:6fc3:79c3 with SMTP id 98e67ed59e1d1-303a7d6f7efmr6842321a91.9.1743093379744;
        Thu, 27 Mar 2025 09:36:19 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b6bcbsm2654960a91.45.2025.03.27.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:36:19 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:06:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: MANISH PANDEY <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 2/3] scsi: ufs-qcom: Add support for dumping MCQ
 registers
Message-ID: <zvh4v7am3exq3r3osmlxzak64rqs6uayjxscvhkuh4zezd3rsq@5og7cpvezvpb>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-3-quic_mapa@quicinc.com>
 <20250318064421.bvlv2xz7libxikk5@thinkpad>
 <12753be6-c69b-448d-a258-79221f4dbc7c@quicinc.com>
 <awc2ql2x5amiahf7l47xqhgl7ugi4zpk5wz7qycgbqb52gh4yb@24za7q2rqqob>
 <6fcefb33-a488-45a2-b34d-08a85ae7a0ef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fcefb33-a488-45a2-b34d-08a85ae7a0ef@quicinc.com>

On Tue, Mar 25, 2025 at 02:32:58PM +0530, MANISH PANDEY wrote:
> 
> 
> On 3/24/2025 1:09 PM, Manivannan Sadhasivam wrote:
> > On Wed, Mar 19, 2025 at 11:51:07AM +0530, MANISH PANDEY wrote:
> > > 
> > > 
> > > On 3/18/2025 12:14 PM, Manivannan Sadhasivam wrote:
> > > > On Thu, Mar 13, 2025 at 10:46:34AM +0530, Manish Pandey wrote:
> > > > > This patch adds functionality to dump MCQ registers.
> > > > > This will help in diagnosing issues related to MCQ
> > > > > operations by providing detailed register dumps.
> > > > > 
> > > > 
> > > > Same comment as previous patch. Also, make use of 75 column width.
> > > > 
> > > will Update in next patch set.>> Signed-off-by: Manish Pandey
> > > <quic_mapa@quicinc.com>
> > > > > ---
> > > > > 
> > > > > Changes in v3:
> > > > > - Addressed Bart's review comments by adding explanations for the
> > > > >     in_task() and usleep_range() calls.
> > > > > Changes in v2:
> > > > > - Rebased patchsets.
> > > > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
> > > > > ---
> > > > >    drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
> > > > >    drivers/ufs/host/ufs-qcom.h |  2 ++
> > > > >    2 files changed, 62 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > > index f5181773c0e5..fb9da04c0d35 100644
> > > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > > @@ -1566,6 +1566,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
> > > > >    	return 0;
> > > > >    }
> > > > > +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
> > > > > +{
> > > > > +	/* sleep intermittently to prevent CPU hog during data dumps. */
> > > > > +	/* RES_MCQ_1 */
> > > > > +	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
> > > > > +	usleep_range(1000, 1100);
> > > > 
> > > > If your motivation is just to not hog the CPU, use cond_resched().
> > > > 
> > > > - Mani
> > > > 
> > > The intention here is to introduce a specific delay between each dump.
> > 
> > What is the reason for that?
> > 
> > > Therefore, i would like to use usleep_range() instead of cond_resched().
> > > Please let me know if i am getting it wrong..
> > > 
> > 
> > Without knowing the reason, I cannot judge. Your comment said that you do not
> > want to hog the CPU during dump. But now you are saying that you wanted to have
> > a delay. Both are contradictions.
> > 
> > - Mani
> > 
> Hi Mani, Could you please clarify what you meant by delay? Did you mean
> udelay? That's not the case here, as we are using usleep(), which is similar
> to cond_resched(). I believe both serve the same purpose in this case.

Even though usleep() allows the scheduler to reschedule other tasks, both are
not the same. usleep() puts the thread to sleep until the elapsed time and other
tasks may be scheduled in the meantime. But cond_resched() will allow the
scheduler to schedule other tasks *only* if necessary. So the scheduler may
decide to continue executing the current thread if it is well within its
timeslice.

> Therefore, I chose usleep() to provide a fixed delay between dumps since we
> are dumping a large amount of data. Additionally, I wanted to avoid any
> extra scheduling latency associated with cond_resched().
> 

This doesn't make sense to me. Why do you want to provide a fixed delay? Will
that delay affect the UFS controller by any means? If not (afaik), you should
use cond_resched() as that will allow for faster dumps and also not hog the CPU.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
