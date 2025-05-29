Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A8723184B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526577; cv=none; b=uiCP8wo1bnwMBxzx5MvKxiRSn8xK4v38b8q7Xa0prfT0AtEDcV1bcZpT3oIRL21Q9QQZUvj85WHgeTswwpK9kXIr+saicM8N5DG466VfVZ2cgd2AqYgLrz8Q39l0Gb/alK2n16DXDxzF0UAu99WJPEgT3VX5iBS6jbTI6IMwuzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526577; c=relaxed/simple;
	bh=u/EguVCnOE3hQIZ53Xs0JarqHTQpOSsf8AcGao5mjxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/mPl9Fh0SnhK7NsGSe0QU9O6H/vfo7SNcwbV2Q4WGpgSL8Y7PW69C1X8sylf0aXXWlNkW1gbVbkm0CwSsEE4k/nlb65tFekeHPi2NVN6BFM+feEu2l1dvEDAqThgOuPa2PbWIfpRKvpPilrg5Un2GXn7qzsqcHQvwzRdrBd4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mblCNnh7; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mblCNnh7"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fabe9446a0so11024326d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748526574; x=1749131374; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/EguVCnOE3hQIZ53Xs0JarqHTQpOSsf8AcGao5mjxI=;
        b=mblCNnh7vsI+hLVKfUE9jg0h64TvHcOxPP0N167U+tyRIn9pV3M/1qOO164i/g0kTa
         32APWyq1RpIT3NGseYasg5KMmZq34gnSU7KuUhQ74sD7X+Tld6NWowCy62i2cBhjfVk6
         OYOueQAfysY8NqMD5UZhGfwNHsnLhH2AR/htU3gTnWMUNrWEhjDYONIjpOrV0L5Z5/ZK
         0Uc4dqtrntRhHTkPJ2l52TQJOdYDw8ifAvROA1OydSesNCzGSI2McogMmaJZs4yWi5g2
         KJ5nPclUOd1ms68GB8OTiOJm4W7MXQB0y7HecYa53yCWUFCbttJL+fTBm3t4MTlSRSqU
         zfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526574; x=1749131374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/EguVCnOE3hQIZ53Xs0JarqHTQpOSsf8AcGao5mjxI=;
        b=ic5jNjJ+E0DApsU4IY7nbtL3eNAnIBMlPtIIuC2dTNvuaU2xyE1Nng9KpZVIBkToRn
         T30zONeVE6BQ/Pd/XUrzSRf5GFL42+MgpXJaa1vIOtOrr3xU7jIGJgamlSKDtyJhGOPA
         LQG4Dy9CoR86Qcq3msHupt065/WmgXS5y/gyOHAlXSW9nP/RhXAIdn3l20dI43t+tBTr
         9cORjLZXNz1nSCBuCqZJvTYCuYjePZneL/BmFA2kNs3FOj8fdUmDbkw9DahbrSszVNe7
         rbmc8fSMkdcKG+OX7p0RNqidEt4PIPhSlqcuqSkCZP4LFIelJ7ABORauR2TZUzTRi5rz
         P6pQ==
X-Gm-Message-State: AOJu0YzBDXxFnCmpLosatlxvwFgWwHAvNzPLkKpWJevd5NsITkdItr1F
	KN9TXJzBfw8DFmlfk4K31bJoOlPmvvWo5pfI05yCNCCAuEQXV/eoc5VcqQ18lg==
X-Gm-Gg: ASbGncsZSfRbenx/8+UlLKC/LlaAjPejkGADQctdIfD09dal6YUEhqsyYpExgzBP/be
	vEGd1yAmtgYPGSwvWD9CG63okWS8nj06eNcs3GGcQBR3wBPPg4o0U9e57ZY8eB6iDcj7n519dgQ
	YxTbTwpeCpQFvfk+Ek1hsbPvJfvIEKl3XfVUdcifwPivLl0fdE1o5JhZXH+nzoB7pPBaEcHVQal
	DHeGBWYxCIshmQ+Kg+UgTSaqSt6svmipuUcO2ok3NfGzufiJumdYgWA+oE+Q1tU1CC4pJFnnewg
	zaX6po4Y8mSNarDavQ6uboKU1clNBQf8JkNswEJJUsotCwb0KKp3kQXE1RUDdNR3H/bu8UOkKkq
	x+uTFmYCdtke1
X-Google-Smtp-Source: AGHT+IHvAC9XXuIEEupHwgw2KjiC1d+IuhpHj+UY2ta7baUzfvzvbgonFAJYR9FrZ30ZdDkY0lsNFg==
X-Received: by 2002:ad4:5b8d:0:b0:6fa:c463:fd22 with SMTP id 6a1803df08f44-6fac83dbbf0mr34971166d6.4.1748526574250;
        Thu, 29 May 2025 06:49:34 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00b78sm9530616d6.75.2025.05.29.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:33 -0700 (PDT)
Date: Thu, 29 May 2025 09:49:31 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: konstantin@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org
Subject: Issues using lei
Message-ID: <nbcqso66co3cuuhbn323kduushqvy645xynjgetmcrawfclmzb@nfdor4jrns6z>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi konstantin,

A little while ago I read through your blog on lei and found it really
useful in my workflow with the Linux Kernel. However, recently it seems
to have stopped working for me. I get the following error when doing
'lei up --all'
Exception: Expected block 38874 to be level 2, not 0

I'm guessing this has to do with recent protections on lore.kernel.org
from AI scrapers. I was wondering if you found a workaround?

Best regards,
Alex
