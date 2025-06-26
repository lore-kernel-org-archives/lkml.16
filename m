Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718D255E23;
	Thu, 26 Jun 2025 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925396; cv=none; b=fXdc4Ibl1ZS3tDQdfMLEJFvA30fJwGzskmKLIURGR49Ob+RFGx04XHzddo/0utzUejHdbUH/oIEE7bfa/cq1840p2fCzjGn6CMhAWBC5JKy+PIgmXDxg8q9e2GWQKuEmT4Rpi2NQqChYzDQC1OL1n+kpsUHIOsBS7ss/nO2JG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925396; c=relaxed/simple;
	bh=PHi1hXoSBWIFlw3DxUeFBBUa1N0uQHV0aUK5fHeJIuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD0Gp0NmAutN8bfKE0NRMJivb3782VPkqTNh17317bzL3Bwy85hawcLL81G33IbWgjvMSWimIVvshSFlojlzP36FduvIKI1sHElLGVmNpgHq5NYVhUci5bZexoy8xZN96seC1rKFTF6D2hm2csVebYUcQ8kudKO9gfU3PBe3FfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhfUoC4s; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhfUoC4s"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234b9dfb842so7272175ad.1;
        Thu, 26 Jun 2025 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750925394; x=1751530194; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYeAxYNkETvVnI7X/wMdJ1gHCj7R9h1mnTQ5D7mumU0=;
        b=QhfUoC4s29a2NyRAYZobDW2jkfXyIyMad0vCZRqAJrDEMpIrvE9wW5++V+OnSQ6drF
         Y3b9DfSlWP7p8NwrzSehUjJk3l6GJ+DILgm8eDwBXCX76H4XQvx/FureDVa09LW8Ux2Z
         jhnSQsB9CDx+djVjbsJGH/CsoiXx0FjWWW5WxLmubde90WgYtm4abSzsKDg4Yol/smL8
         pf/EOyC9zet8+CiVaTFq02yRrMsa8J3ArlqS5V9Cibz75gv6SeStxD5BT9YxrfYwL5c8
         sHvuxZJMu5rbCDJfqXem7jR3PTcjZ9m+/Sqwn2gjw0YZG4dCMHdmgG/T7jNqmy6LC592
         LopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925394; x=1751530194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYeAxYNkETvVnI7X/wMdJ1gHCj7R9h1mnTQ5D7mumU0=;
        b=NC8b5xFrwrK+TWEPcw5p7f/YVmNLDRAKMaKrElqJ1PIX03kkUGE+k5t4NgYpozORXN
         KgnYjHAxk133ABTNw1/I6WOxNy/5FMq2/TSKR442rCPh9WoFshHkZa9znU5V2m03fWAS
         FFtPj67B/52hCSJQ73ditVXRCNa8p8HuQiqxDe0N4+Vd7eNXdZobft6MejDiknrgPtq8
         nTnRj/kK5DPRrTHQz++kd50/t7M8f8L87EZlqVeX2fPI4AKwpDwpLO6w5EjfUuGPyOmi
         se6K9564BbY+2Q+kMN4tHQ9kT82NG2euViguMDCFfN/XrG/JQN9YmB90A6/wZhrlY3Cu
         RgZg==
X-Forwarded-Encrypted: i=1; AJvYcCUKVZ/qrTRXzKABK3mJKey+JCPyj6I4Cm8EXHM0WtWpooNdKuBN909plQXCi2j8cP81Gm6rvhPjnk68HUiNvpTknDcopg==@vger.kernel.org, AJvYcCXkYNIRoLnIZLj57PLXbFfobQIMJWS4+wXT0v+qf0xEI9UYXiKzrO0PmpMAmVbG+wflN08W2A8YSyr6v6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjzQXcWLODcPTsUCjkfvoQUkziFQ6ySWZSiq67Swdsd1UmxMn
	QjSDzcChINceZDnHN/7Ez/RF3LZPFQ0N0vMc0R1YZkZWww1+YmQWm65G
X-Gm-Gg: ASbGncuf2Ob9uaiy9kjrmRi1zFWJxkJ1cwJ/G3gYvFiMVmm/0XQw5rNVLyxT1A/65bu
	k0g4ur/qT1V5iDtAFJ3XHLanHYReHQfm76jPxxtEOtLEoDR1KHHnCv5qzI0tLfIOr5y4Sae1m1U
	l1q8Ge7KwF5DfA9Lr8Puxy+oBiY89rzhV8+TUPzolpQR6eT/h7188SGz8eLTA0Io7kqOwDrmdUn
	XU/vXVZ2jJR6XdxVxs5hODyYvPcD4Qjb8KCQvvya/ue3SBTyZcsy6bxSYc7LxarpJSMontrRAER
	/rovtBLOgXbyygkkdJA35ZUG7SkQ9Cd4HN4WIgG9IiZHepOH7WX9VOebkc4e1Pe4xbK6
X-Google-Smtp-Source: AGHT+IFsD0WQNj0OBHjLSRYECslakr3hBfqHf6yykY7k28DC5wJi2o59UFj+ssgrkHslz2wSe2TlrA==
X-Received: by 2002:a17:902:f684:b0:235:60e:3704 with SMTP id d9443c01a7336-23823fc3f99mr110318375ad.12.1750925394114;
        Thu, 26 Jun 2025 01:09:54 -0700 (PDT)
Received: from localhost ([203.123.65.120])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d872a3d4sm153654465ad.239.2025.06.26.01.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:09:53 -0700 (PDT)
Date: Thu, 26 Jun 2025 18:09:48 +1000
From: Xiang Shen <turyshen@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, acelan.kao@canonical.com, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix code style issues
Message-ID: <dj5vu3sfnct2jh53ztglh3tpoa4szs7oi77er3sjnihajwba73@2mb4bxzifqrt>
References: <20250620003849.54442-1-turyshen@gmail.com>
 <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org>
 <hlsev7jydwejtdlyay6e6f53yorf2aguhxykscuukqfxugg7ff@hmmpcg7s4sx6>
 <83b27cc9-3544-4fd5-4ece-a46f422ec6fe@linux.intel.com>
 <rzzqmdogpedswwzdjutskz2ik5duik7c2u433csogl5g4rptdr@nrzck7xdvdcg>
 <2f19dda5-a814-8572-2d5f-e851d6a747d4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f19dda5-a814-8572-2d5f-e851d6a747d4@linux.intel.com>

On Wed, Jun 25, 2025 at 03:25:52PM +1000, Ilpo Järvinen wrote:
>On Wed, 25 Jun 2025, Xiang Shen wrote:
>
>> On Tue, Jun 24, 2025 at 01:35:57PM +1000, Ilpo Järvinen wrote:
>> > On Sun, 22 Jun 2025, Xiang Shen wrote:
>> > > On Fri, Jun 20, 2025 at 12:00:03PM +1000, Hans de Goede wrote:
>> > > > On 20-Jun-25 2:38 AM, Xiang Shen wrote:
>> > > > > Fix checkpatch code style errors:
>> > > > >
>> > > > > ERROR: do not use assignment in if condition
>> > > > > +	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev,
>> > > event))) {
>> > > > >
>> > > > > ERROR: do not use assignment in if condition
>> > > > > +	} else if ((ke =
>> > > sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
>> > > > >
>> > > > > Signed-off-by: Xiang Shen <turyshen@gmail.com>
>> > > >
>> > > > Thank you for your patch, but this change really does not make
>> > > > the code more readable.
>> > > >
>> > > > The contrary the suggested changes are making the code harder
>> > > > to read, so NACK.
>> > > >
>> > > > Note checkpatch is just a tool, sometimes there are good reasons
>> > > > to deviate from the style checks done by checkpatch.
>> > > >
>> > > > Next time when submitting a patch to fix checkpatch issues please
>> > > > take a look at the resulting code after the patch and only submit
>> > > > the patch upstream if it actually is an improvement.
>> > > >
>> > > > Regards,
>> > > >
>> > > > Hans
>> > > >
>> > > Hi Hans,
>> > >
>> > > Thanks for the feedback.
>> > >
>> > > That's fine if breaking the "rule" is the only way to keep the file
>> > > readable.
>> > >
>> > > However, there are only three files (x86/sony-laptop.c and
>> > > x86/dell/dell_rbu.c) out of 273 files in the whole drivers/platform
>> > > folder that have such an error.
>> >
>> > Hi,
>> >
>> > Please don't call correct code "error" even if checkpatch may label it as
>> > such. The goal is NOT and will never be to have zero checkpatch warnings.
>> >
>> > The fact that the checkpatch "rule" is broken only a few times does not
>> > mean those 3 places have a problem, it just tells it's good rule for the
>> > general case. So I won't accept using such numbers as a leverage against
>> > the few places just for the sake of silencing checkpatch.
>> >
>>
>> I just thought there must be a reason that the checkpatch categories findings
>> as "ERROR", "WARNING" and "CHECK".
>
>The checkpatch change submitter just picked one of the levels. They're
>humans too. :-)
>
>> Sometimes the number does make sense and means the vast majority
>> follow the widely accepted "rule".
>>
>> Curiously, isn't it the contributor's due diligence to pass checkpatch
>> in the first place before sending?
>
>Hey, that code you're changing is not being submitted. We don't want to
>waste our time on "fixing" checkpatch warnings on existing code when the
>"fix" results in worse readability that before.
>
>Also, if you would be submitting a patch and checkpatch suggest you
>to make the patch worse, please don't follow checkpatch's advice even in
>that case!
>
>Checker tools are there to help find potential issues, not rulebooks. This
>is often overlooked by many checker tool focused developers and results in
>low quality patches (there are exceptions too where they developer really
>tries to understand all the related code to see if the change makes sense
>/ improves things or not).
>

Hi Ilpo,

I've learned a lot — thanks for the thorough explanation rather than
just brushing me off.

The rookies are certainly more likely than the veterans to treat
the "rulebooks" as ironclad disciplines.

>> Should any objection, submit a patch to
>> checkpatch itself,
>> instead of sneaking into the upstream quietly for the sake of "readability".
>>
>> > > Perhaps there are other approaches to make them more readable without
>> > > breaking the rule.
>> >
>> > Perhaps, but I'm not sure the effort spent to find one is worthwhile
>> > investment.
>> >
>>
>> Indeed, that's precisely why it might be worth sacrificing a bit of
>> "readability".
>
>Please stop trying to sneak your subpar change in.
>
>NO, this a hard NO from the acting maintainer. We'll not be accepting
>misguided changes that are to silence ANY checker that should have know
>better (those checkers will never learn enough to be relied 100% so
>please stop spreading such illusion).
>

I wish I had known those checking errors were intentionally ignored.
I'm putting a full stop here.
