Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B618DF81;
	Tue,  4 Feb 2025 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671711; cv=none; b=vEDISP5XJqqhjX1BC76xbpqaoyDvzUL2TbgXtXnwS2+YZf1OCLL8kVIG0jyeJjQE/MB+MoVlQ9MUWc8zDDaS+0nZH0jcd9M9ogqv8zpbt7NVZpx5cSca7oXbGdxSddU99rSSvOHXotdZfF1d/Vn6FUGYWwneoy4qTgY86wzdPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671711; c=relaxed/simple;
	bh=LLEZc+6K/sq3diCJw519PYCk0GDn0vH2KYZFpfTiGXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5WZArZ8h+fp2kRn+zU6RSWDxaTAu+Kbbv7X8yDxS9y9lNF3x05d/86EDCLJkq5nhs372fycXzRuHv+kSoO6RCJ2/Gtk3BLQ9vg9BK8HgIfd6nONFV5P9y8neboRo1w9g8NFMQtHnX2LvIc/wQL6PYYBdqhF/Anr4VXmKrUzZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnF5lvg3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnF5lvg3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21ddb406f32so7857155ad.2;
        Tue, 04 Feb 2025 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738671709; x=1739276509; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7cS4dggVWYZWq13ZdNTbAJXOACF9t3BShg1ZFEn8QOY=;
        b=RnF5lvg32wf/HVfn9teTtKKEDeSfUNhQOubVZ9qNULsrYfH7W+Bb04bShrf7uQYcXK
         EmX/yVV8x81LONPVx+mVDRwGNDMBKFYTVEszXldVkWZsRcFwKGPAhPBu2HRq8izP+bQq
         IDQcybaxiI+Mp/I9xQZQwgVp0Tq/ca0/Wx3e6jRdAm7wAAbKDsxlyU/+PxuiC1taLmHG
         h5ASKLZAN2cNeZ84sa2/tnW+vmuPq6XqbCI5UvvbmfkgwtYJbVFDXE7HWpirEbKuTT14
         i1mhFubsxnfHQZdOSHvQK/yNL+ZpYbx1COzGRyx9ipIQNI90kTcONeTsPMwpXw4RevGZ
         BhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671709; x=1739276509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cS4dggVWYZWq13ZdNTbAJXOACF9t3BShg1ZFEn8QOY=;
        b=OomlLLhjIIbqbCLn24L3vlGPAVANNd20wzQ4NJ4nb6twoKh7lHT98dRqHmjIbtP0fF
         H8lDSH3qOQxvxy8oHF+TZHvUqc5NlR+Xl8v3R+X5+aaxKJKxrlBux7WIEcfygm/wbNg5
         J3wa+nMLaIsSC6CNq8oIkGLTW0vE+38Qsdzk7GPHa1a58cXGjho/2IZ2ak1HqkSO8Vja
         1cx29NrwddjnSp0JLLPlL0eu7qP4SXiOwxqusxsJ5udzXXWyZYT+BOEM8Vl4siE8PFQO
         se1JvOdtWTe6b7l8yE3BqysvXjLq7SW2xCCKoQ3kPfgorphBqXo7RLZWDZ32c0hBCN9V
         YsGg==
X-Forwarded-Encrypted: i=1; AJvYcCUqL3xP0+CuD7XTUkl58RKIW4R7pQBwUDmfqPTbXNJtgH1YXQDPSeLAkmTOt5zKNtKQ96U12Z3TfZ7p@vger.kernel.org, AJvYcCXdtS/gK/wJWN/JvnPs0tG83QHtnSWlojuq/dqQADBWh0zq/z9ABNmX9+P09PaVa+5uXia/68NvkYvI4SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgSjscoMtJ5hZunyLcz1OIBxSCQVNDiWp9A0p8S+7U3F1FP6e
	uCJIFqNu9oC5w3ecQ2bquMu6qCgvRwc4omT93ITgHFJ9KUyIggP+
X-Gm-Gg: ASbGncvQsG0oxjqB1aTEd5Q+zv1JfubYMRk0s3EFMiTv3at6LoaJC8IkL4Mycd+AfX0
	WOTv/t76TRvu1CMFi6+hgq1Hr316N/nJYUJnkqkZYZvzEqpdSYEzVNaC+6CscK9qVbsoEb0uwWi
	lhoWFE6/jJ9j2B0Fio8re0gaMnlKludepziZwaTKX+lWm/TUHfQKl62PZES1Odi9gA6RoashEF9
	+aj80YgyE+6t1oURvA+VAMPFnmza3lqWXuZnwy2skcoZ6Lv83X6kY50rL3v0aONspQ+F7AOMYtb
	NEpBwGAMgqnSfw==
X-Google-Smtp-Source: AGHT+IESVrrcVC4PHjZiBnNC/YCcnmdYkIHIcQ75jCuobi+3FsaoRJDY4toRo70naepl2w0KpDGptw==
X-Received: by 2002:a17:902:d503:b0:212:63db:bb15 with SMTP id d9443c01a7336-21dd7def2f8mr434437245ad.38.1738671709030;
        Tue, 04 Feb 2025 04:21:49 -0800 (PST)
Received: from ubuntu ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f088fe8a3sm9771795ad.256.2025.02.04.04.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:21:48 -0800 (PST)
Date: Tue, 4 Feb 2025 02:35:16 +0000
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <va65iv2kmvqtg4ikoakdtdpproz7nlxx3hdy6biqkfci445f75@btgh44vhvuc5>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
 <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
 <20250203123944.GJ3713119@black.fi.intel.com>
 <gdojzsdm6kmg6kdoubhg3h6ebedyjswwzofdzxhfcbbdl3gsy2@wqpqcdukpn4h>
 <20250203125906.GK3713119@black.fi.intel.com>
 <20250204111624.GM3713119@black.fi.intel.com>
 <20250204113955.GN3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204113955.GN3713119@black.fi.intel.com>

Hello dear Mika.

On Tue, Feb 04, 2025 at 01:39:55PM GMT, Mika Westerberg wrote:
> Hi Again,
> 
> On Tue, Feb 04, 2025 at 01:16:25PM +0200, Mika Westerberg wrote:
> > On Mon, Feb 03, 2025 at 02:59:07PM +0200, Mika Westerberg wrote:
> > > On Mon, Feb 03, 2025 at 12:43:04PM +0000, Mohammad Rahimi wrote:
> > > > Hello again.
> > > > 
> > > > On Mon, Feb 03, 2025 at 02:39:44PM GMT, Mika Westerberg wrote:
> > > > > Hi,
> > > > > 
> > > > > On Mon, Feb 03, 2025 at 12:25:21PM +0000, Mohammad Rahimi wrote:
> > > > > > Hello.
> > > > > > 
> > > > > > On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > > > > > > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > > > > > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > > > > > > Link, as specified in recent changes to the USB4 v2 specification.
> > > > > > > > 
> > > > > > > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > > > > > > published in September 2024, the rationale for this change is:
> > > > > > > > 
> > > > > > > >   "Since the default value of the Target Asymmetric Link might be
> > > > > > > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > > > > > > >   this field to make sure it matched the actual Negotiated Link Width,
> > > > > > > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > > > > > > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > > > > > > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > > > > > > >   Recovery flow before doing Asymmetric Transitions."
> > > > > > > > 
> > > > > > > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > > > > > 
> > > > > > > I did some minor modifications and applied to thunderbolt.git/next. Please
> > > > > > > let me know if I missed something.
> > > > > > > 
> > > > > > 
> > > > > > Looks great. Just one question:
> > > > > > 
> > > > > > In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
> > > > > > the link recovery status. Is that okay?
> > > > > 
> > > > > Good question :) Looking at the ECR, does it actually say anywhere that the
> > > > > CM should needs to re-enable it? I'm thinking that we could just disable it
> > > > > and be done with it?
> > > > 
> > > > Right. Thanks for clearing that up.
> > > 
> > > I'll check with the HW/FW folks still if they have any suggestions. I'll
> > > keep you updated.
> > 
> > Did not hear anything from them yet but I adjusted the patch slightly to
> > restore ELR if tb_switch_set_link_width() and also added back the check > 0
> > which I missed. Let me know if you find issues with this one. Thanks!
> 
> Okay got response now. It turns out this feature is something CM needs to
> enable if needed (e.g it is not automatically enabled by any router) and we
> don't do that which means this patch is not necessary, sorry. I'm going to
> drop it for now. Let me know if you think otherwise. Thanks!

Oh, I also overlooked that CM has full discretion to enable or disable it.
Anyway, thank you for keeping me in the loop and for all your help with this patch.

