Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14F1E833D;
	Sat,  5 Jul 2025 03:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686486; cv=none; b=ZnUiQtgHnxaMZlT1Gik1/TrOtPYBabcRCYghr4dQgs+rkvOtrnCV8zknNO6cShod3B4dhFfV/ScYBqkl4O/cqPrYX34pFsXw5cNEuzKMv1nCbYqGrlzGxf2Mr2iYb6rmyHs5jWhOs3Y81+bkYkrzmvA6R5RStIXOKAv5J/kvq50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686486; c=relaxed/simple;
	bh=PGzNmxKPeKeIW9y3SLrZgxUtNxszaOvcO3mqQbh5IU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIcfvrGY5dW/vWjvEhb5f6fY33ISBuyTnKDK4RzUc/aRpUJL8lusplVzepx2xa7RpkLxBKLOWvKk2J4XkLi4EtyWOdrUkgPQMFIkBFwMIZbVQ0O/FQozV4oAJ1vrqK8CTVEtAbbNO/++s/xfdO7T1NIgAHUGsS73SDzj+IE0y8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByJlUMkY; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByJlUMkY"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44b3526e6so23058511cf.0;
        Fri, 04 Jul 2025 20:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751686484; x=1752291284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXIjFbe4Vrz2bi8rFlLHVCaoVK6EIDR/YQX7SQMy1sc=;
        b=ByJlUMkYBepacORcc6b4fWAjEW6wFw9NBADu7HzVHuj0Pf7UEk4pT0QyidZqp9Y57y
         MIUQROBOlfeHSjRL0BL8V8MOWbFi/91OtoLu5DqJDAWHmuSq8CphjjOfJcao0Xqu3Rol
         KdMohXidWsORwEm2kGdCFB3SNpw3bZEGo/Zo1KDwkA28jko+ZUi5pygGeCSPbffxEVyR
         ewuIClN+xxGO5fZmL+f7ME6mFg1vxwrusjBs6VTujImFAizDRbUYcm8kNO8k29WpUzUF
         aNVm5LKvGEhLsKtHh91Q5266kYj/wV4SMYX6uieXmeHYw9Jz9TtY0S1is0Bwq4RXu38Q
         P5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751686484; x=1752291284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXIjFbe4Vrz2bi8rFlLHVCaoVK6EIDR/YQX7SQMy1sc=;
        b=HM0Z4Qga3X9qq1Rc6X/KV3fwcGsodGfLwmlRsJxnyr83/jWmSpU/obrUFWmTn2CssI
         UafyHQcl5bBxcHTeIhmk7vbmbt6qPPu+cB455Axi9NoEuP1+5+alUL0B5iRC6pe0DAZL
         qo2HLULLyxvOqswQh5IH+BixL7TWGDwEFpnxY+0MTvA78aBj0XtiAIanT4FRKQOgMuKl
         /R8ZMTX3zKrnPC+XdVf3YqAmO83OYEEYOkpKbhkXTak1BrzQPfM1NLLVGs6VkFfDlYuz
         jcSX/6I0G4GxOHz7NDq+quG5/V3JHoNqT0rMj17+E85n00EeCLJGHxuS/y66xShXfgpe
         TJgw==
X-Forwarded-Encrypted: i=1; AJvYcCXOfT1NOJtPueegklaTXICrt5P9Hp39r7PTrx1h+a5qGTXafuSDyup9+Y/SLzPQa8RmPdI6Q7Goyt258UKce/m/ynjdRw==@vger.kernel.org, AJvYcCXgbNCBEi3Z0/Jc9ZsRUChkvnNLga2vc6grq64VnSy0BuL/57t8OlEt3fErEJSQb+Nox+ikfr9uAT+Y0/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBKhEjEVjU/Fetp96IF0nfChnBDQ8UsFhVBqViynisD+NXsgm
	rCEVDacGy5Mmne253Aem6RnpBa9XugqaOFZXp/cX6rdeY/Pw15blX+TY
X-Gm-Gg: ASbGncuwgavZwFPGpxg8Sod3eJVtVsP3h3Dcj+kh3hZJsfXGpEC9JjPoU3LDyNrljf2
	T3xyNxFXTr0OEDsPm8GZ6RpSSJJWQ4KTdLm8JDNxfmCNLALTBnUZg9EVS4cKDV4GMZcWkmM51MX
	v3l/GAvvHHQHPBUt9i2MVoTieK9Wt2LrpuJE1lUhfZw3EAz+YbMTjrxXJuVaWqMAsarF9ezmBEO
	o1fs/OtVPg6TFMjvVYILHcWMz/1MNn8gcDPBC20+ipovJBMzNcnj24NTxEOol+RZ4VJ231jlnE3
	YKqVt62Yopd94YZwJLr+w+rpjyN0Oy+oyqubuXFER2cB0g5QTs0I1Z/+B7/+T2tNgTMxrbnA
X-Google-Smtp-Source: AGHT+IEEL+nGQOQKOqbHnIIL062aFeOFyIJtWqnNnWtY8TBhIxolpSi25iRRGZvQnCMlcsZgGHMtcg==
X-Received: by 2002:a05:622a:298c:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a9a695de82mr20294141cf.34.1751686483600;
        Fri, 04 Jul 2025 20:34:43 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4a48sm25850281cf.13.2025.07.04.20.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 20:34:43 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 05 Jul 2025 00:34:00 -0300
Subject: [PATCH v5 5/6] Documentation: ABI: Update
 sysfs-class-firmware-attributes documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-fw-attrs-api-v5-5-60b6d51d93eb@gmail.com>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
In-Reply-To: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=PGzNmxKPeKeIW9y3SLrZgxUtNxszaOvcO3mqQbh5IU4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkZc202WJmJ+Kr1H9NsEjln++1c/zwGa+EPAQ8Xud7N7
 ZPYJmrYUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABPZaczwT3fejkUt7mb6H/VO
 tQi6iO35IrtuB/uNhMyHh2e/PDlF24Thr4SAav4yu6npDxd2zzkhqbH9kbX+krytPz/wTrgnzWp
 +jxsA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a simple boolean type.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-firmware-attributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 2713efa509b465a39bf014180794bf487e5b42d6..64b8d5d49716e8387fee26e3e56910862f6a4f5c 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -18,6 +18,7 @@ Description:
 
 		The following are known types:
 
+			- boolean
 			- enumeration: a set of pre-defined valid values
 			- integer: a range of numerical values
 			- string

-- 
2.50.0

