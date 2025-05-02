Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D91E0DD1;
	Fri,  2 May 2025 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177086; cv=none; b=PAvgset8csbtRGPgkvFERb67Ni1Qelp+jJasWvaEUiwsXkChtGFT0UE6Acor/j30xiCOt7MwyTrhgj/nVpUtFi89qtae436pj1qDL3BAr+wAB14uxTZS0tCz6ZZCiAMooW20ohzJslswhCo7QxN3FQyj2e0NOXLG+Zpe8RnhO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177086; c=relaxed/simple;
	bh=WPK5kCiruj735CNe/WVKxdtmr9Fw2KBkQoFZSLwqw74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SK+CcOyIo0KSd4SiQfoRav8UOJqe+hkfN0+UuRreOnvyCxbRZvJvj6EXht2domq/y8PfnRYcVaYxGUXKFvrYuwD6aF8oW3BNiZ7aMZffuNFqV70uzPiiSC5Le7MCvZAcFEb802poXGvMSUSGuDORXtnm2CMzir6EN0oaDkKHLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTBmeQvc; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTBmeQvc"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d9327d0720so14216445ab.3;
        Fri, 02 May 2025 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746177084; x=1746781884; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WPK5kCiruj735CNe/WVKxdtmr9Fw2KBkQoFZSLwqw74=;
        b=VTBmeQvc3sgkE9lWTMivybF69uknoHGDwGuMz21O3lz14VF7R0muW+sXBZ9yVdq4mn
         WHlWsZhYKvcBSTzbWinvfRxbTLbEqYtVuPRK+SJReq7h9vaU6sy/Wr3W8pswiwOaFrCw
         SKSGmZLNYgs1JbipRsG3MWs03TyIhTMUxSvvO3ovHg7gKrHhrmL6B/0IEQgSsvC1JaNK
         k9B+ink8K+Qedi5SQrw0Xxa3+LPuQVaOP2Qm0hOh+OwciyYc7vEFbSY/w9mfeKW2kCZU
         hF7QN6gajkwqJx8+Yuc/NGyFAXIF0r9PnLvcciFauGFggfWHKCMbf+gtjEl0y4poPsRF
         Kzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177084; x=1746781884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPK5kCiruj735CNe/WVKxdtmr9Fw2KBkQoFZSLwqw74=;
        b=nBZdI+A2x9PkvV6wr1MUVGWJFYdKRfxuN1wsFeYyG1CwQ8FfJfCv53X/jN7NsjU4TA
         zLAL51OAHLGp/ZqWt6VgT89ibkbNkJAThfiPKaI+YhijD1GURIMH8Zw+mchnWLBr8mad
         fKh/Udr7GLYLebi4cpPBQlv6gNONDPR/ZLK8nRvVKFN/w9dHlF8eOpQMlMCbkDG3EREg
         0MbWAq5Szd5zdLPbmwGC4TF2ayrrzeLaQqQtRNFbF9VMfQn0xWcUoKLAdduzWsDf/xGb
         FdeIhllADH+/dr6P/JjCvSVn0mQJY8fG8yF3BV/CdCbCPeuoZyUCACjH7ccJHIZ3y7JQ
         tP5g==
X-Forwarded-Encrypted: i=1; AJvYcCWbYf0+kgOLi5nH29wK1jkifi08wgqtXXcIaEQ6Ie6wm44HmjVHMWCQVEUhs3SORc6OmPNFDc9CW3FCManC@vger.kernel.org, AJvYcCXEfS/HkvTdy3NIzg44ImGedoIKla4g5YKHioY8i4wZJHP0w6BB7X/4uOx1bJeEvzG0K6E/BOWEQ8sN7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTUyvibB9Yu+7mOdPc4FzrOheMejNTFttQBtVt15AjL3CxxmN
	wyaGV0lvwNm5AGkyQyZ+SdlyBgDrCSNt1MPQvRTavaz0DoH63RbWICZ/CV1mmbNgGc/D/xVilY7
	RfHQTL4Nx8JOmZ2mM5CcCCMw7NsA=
X-Gm-Gg: ASbGnctKxNSpj47ASeP8EuWg7H4bhALKJ7fhtgKpMxPLm50s27E4FVdb0Kytatmofl3
	AnytIBOHm4DsI9k8trQ/HaT50lwZTCw2qUHxTZWLN4NWmo6+w3Xd/9YJfFXFvQuwWwnBnzcrm6j
	co9iwni6iP+C4t6u4awPhV/OJugLDyhXgBqXUAcigAmsBOY447gIyLoNqFyEykvTMP
X-Google-Smtp-Source: AGHT+IEpRXk8NERMfyT/Vkt9QWlBIgZIADM6BYfTXInvTv5XCo+8gp1Js4d4N1MRfm75hzGopO6b7av1Sx12Yeq/QV4=
X-Received: by 2002:a05:6e02:1f11:b0:3d9:2fbe:2bb1 with SMTP id
 e9e14a558f8ab-3d97c1d552fmr28278405ab.12.1746177084406; Fri, 02 May 2025
 02:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424202654.5902-1-a.safin@rosa.ru> <745427d1-3c2d-4ad4-90b5-773466aa269e@roeck-us.net>
In-Reply-To: <745427d1-3c2d-4ad4-90b5-773466aa269e@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Fri, 2 May 2025 11:11:12 +0200
X-Gm-Features: ATxdqUGa5nzkJVMRGp_2rocUipWk_gnsQsIvsRwNF4aNtw_fp2pdP92wJaSvzDs
Message-ID: <CAB95QARQgUC5DZiQTVjwmwVR34fHBAqdDuFsuqhXAVLD_APHDA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) check sensor index in read_string()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexei Safin <a.safin@rosa.ru>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 05:07, Guenter Roeck <linux@roeck-us.net> wrote:
> Since we can't agree on warn or not or how, I decided to apply this
> version after changing the error return value as suggested.

OK, thanks!

Eugene
