Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963B10E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062486; cv=none; b=ubKbAnZwF2QfZAFY0LhaeY6fBJmX+M7L+IMFoP8wa8cBIYQrIWZV7fqYWQWgrUdHDDI7gRG1/pZNqSTfeZ0S9B70Y/1Mi+t8ROO738oMdT2hwjy0ZhrphdkB5sCXPxpiD6FA7pDU84cX43FLc2KMootPelWzwnElyRifZEvvE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062486; c=relaxed/simple;
	bh=kvCsp4ajSClfM+PQkPZ6FRU3m9/CysSi8g5CRuV/xIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmLQNpHV0E2rn7sE+YkZ+NpH76UwX/dmDxP+VNuwTj+o6rjE7GADVdSoIqi8nCNKykAOPLR63SqAyD0L/KMyFIngmdjY5AuR5GkjFGSwGr9o8TcqLhcZZRll99HVvGJrc1NY2HVwQy2YWftkNeYTzrom2X0GmhSb5ZLv0ocBiDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCYdEoUU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCYdEoUU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so88691466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743062483; x=1743667283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a531H04jtlfrLiToQk74ZzGWSJg2ofCUbRy747MJx2A=;
        b=DCYdEoUU/CmihWg/3l9WLPe+h32NAXC+N6tNlT1YzsXCBaDsLGeAr9G0opCSqIyOba
         qqXuLlAm4y7v7wv+Aa4PpuwXjVeKCV9FRPX0UtYRJFwLrVbUpsuoo13LI+KdRAdgVXgm
         erkTZMGrAGkcpHzkUxNb+PZcWBm71HgbXOm4jG5PCRMRdwBWyx0cc0EF49irttV4b0Di
         7DndTh2f9N7+f7J9U0O02UA6GtN9o3oUs7vjsPqxPlRH4z0hYXUcqF+2YrhBANR49CvS
         1HFrkh4zKns7MqFUBZ+RgWZuDJ9STrJI/VdEEyJz6hMo+xGxfJNJWmqVbpDo2diTO1wa
         C7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062483; x=1743667283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a531H04jtlfrLiToQk74ZzGWSJg2ofCUbRy747MJx2A=;
        b=qDjz6bBr9ZlB346f6z6eI+ro0jkWQuF3WAH0wPvdvgj2ULcB5EuheoeKiouKYoWK/u
         TZM9BKUE3+GKd1/kOwYKZobRhp0JHBkXGzbj22S/2cG8umgITkCmww2w6j9if0BUS6W2
         f4y+1AKPftbT2930gXkLM2QLCn2uW5vLjRS+CXNQ/NzGl+3ZavcYGEimC5nzBPF7jz6S
         tgJcLgC0AF2wyxYrbhBdqwhV7UIzVfTA1LSUgl6iOvys0GZq4SIOpG0QylMPLBHBeHA0
         AKUfHhMU3gwK0j6lZxcTWiWiIAwQNVpX/9xi0S03P7OPDeXzdHiRjKC4zJ7/hwysXmyT
         MuWA==
X-Forwarded-Encrypted: i=1; AJvYcCVH8qh97WCZz1t9yQLvCgmB8z/9M7iR5RC+u6rHWv8pOFG+VjxJsPI7CI882cVMewaWjrJjrKPki1Ids9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdTqbffb9JMHKIaV+io6ibz4rlm3/JMMczzn8XtMqbVP9ikcP
	HphMWBoOv0G03yA7PNZcNp8lK1wHwr3TagIGlS0OQHQXVRWNVYVubsfjyV0XQD9KyDa3qA0dgqq
	8
X-Gm-Gg: ASbGncuchxkYLQJTFH8oOvzGa+sbMdX23y+roU6ZK+MRFu3WIUVQu2jWwZ4dluE4tK9
	LtPicN5xnok20QEidL1nz8DwJW/gFt82z9aHTsd/mVbJveXY9GVQadditGevViYTJ0ocaS3EvOF
	W6M5sKSo8MEGTb0vNElUM3+bJY4u77cfgc9mbPn08vCAv630hPKISTLN87FNFBfMZEdJvZpDbel
	WxyJQRCmVf0RXYr8DDXgebh6TkTJd4yn8wViqVfAc6ThEWYRk8N7nx0wDXnC2lqYhTsOStVWUN/
	YszzdMZv0VPkBLmwDxTFTmS9iMzAsYuSGi4AdPSATQ==
X-Google-Smtp-Source: AGHT+IHlAyv/3p/10wHnvPzRB7knGR5QL1WFb/pxotTJbUre9F01yQVEOy4S9yoXSBNRVr+2aItjgA==
X-Received: by 2002:a17:907:da4:b0:ac1:fa31:78cf with SMTP id a640c23a62f3a-ac6fb10c230mr234152366b.35.1743062482933;
        Thu, 27 Mar 2025 01:01:22 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac70c6828fcsm58131266b.93.2025.03.27.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:01:22 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:01:20 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: enable UCSI on sc8280xp
Message-ID: <Z+UF0P5HHzqwejYc@linaro.org>
References: <20250326124944.6338-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326124944.6338-1-johan+linaro@kernel.org>

On 25-03-26 13:49:44, Johan Hovold wrote:
> Commit ad3dd9592b2a ("soc: qcom: pmic_glink: disable UCSI on sc8280xp")
> disabled UCSI shortly after it had been enabled to fix a regression that
> was observed on the Lenovo ThinkPad X13s.
> 
> Specifically, disconnecting an external display would trigger a system
> error and hypervisor reset but no one cared enough to track down the bug
> at the time.
> 
> The same issue was recently observed on X Elite machines, and commit
> f47eba045e6c ("usb: typec: ucsi: Set orientation as none when connector
> is unplugged") worked around the underlying issue by setting the
> connector orientation to 'none' on disconnect events to avoid having the
> PHY driver crash the machine in one orientation.
> 
> Enable UCSI support also on sc8280xp now that the DisplayPort disconnect
> crashes are gone.
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
