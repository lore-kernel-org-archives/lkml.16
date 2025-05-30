Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC2198845
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620670; cv=none; b=gwMGLOGJpf2eBb4oDM+aIQmqzk1UVBJkSoOUb71qnt+s8keRJErTvrwJsYcu0uxaayfZ4ZQeJGvl/8WBqAAjkBL6+jybw45+5AQpWgCGl7YsKVuccLlZOxGpRzApOXiIrSgG1mjEba7rJOY90DOaCxj+6V3WZGebZraJQCa10hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620670; c=relaxed/simple;
	bh=TAj9qOVmmAnBTsrjdbF8ySgsnmwBlSVe32E/LMKKswU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hCB6Ea+8cMJgRKYqqurpSzqVrBC5cmaU9MRaOnHiepU5HXFcEJDMJqME1EKLlH24DvsaEDcdncaCxEq4pl6AvLoSx8eycWtJuYl4QXS3hYvAblz22NwFHBQKxgSslx+1/Ii95XpAhcamP4lFdTgv2dNDya8riTQ4EDNHMAE3qbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXLOrvtr; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXLOrvtr"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e75668006b9so2051338276.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748620668; x=1749225468; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U79xSI/1fqPKoiX7TA2W0POhzwkpRCL7tVrGPJBySe4=;
        b=fXLOrvtrtoShHeIpPqbUux1qs50Gil2Jxlo4g8UjSAP/D70iiu7NA0lALxpXDvpT9h
         uJgDaLwbxabamKSo6bszjYwFdGDAou69z59Gz8frIfj+3SvbsZv+E0JJTaUqDGbhwkxY
         3sHd6XngvBeg1oTiKMmp+66vzWZ1VZYNHuqT/Ni4IVEwVtKHfqariA6y+KlDRBOnTYAE
         9E5fs6rq5eyu+TZ59u1GbTrblFr1Xo1PIm1Qq9Zsp6lczcjACiSEJ309Nv8Vob4Smsw7
         eX0RAPVjla1PbxBEObuqsH9wgABTyQU0X6GuQyFT/fL1wvyUlgFuMAxFoUdvfBBnDklu
         qfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748620668; x=1749225468;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U79xSI/1fqPKoiX7TA2W0POhzwkpRCL7tVrGPJBySe4=;
        b=FdZX+SYshW+YFQlha15p0MXQpigsMkVid35alj3G5p1f6xCS5ubLdw3AXSpMxIM0pz
         BIvz0B7cit8Yvz+TXKYwF+eUJtyhdxL0QER+gpY+AJL9D6qoASxYNU0nN642zA6AC0v9
         WurdeX6Yx+e1OQ8w+NbJd5NK0bw77SKY9YKO71b35V9C9NRa3Jt5OtExZsLd9YSVWS3s
         rS72dXBEzOFJjPTWoB7X9wKBf0wkgAKNsPv28luAwTlKjKwjEBSvxkeSwdeK5tKSQl6G
         w33E1a/HQMY8MGb888adypSw3e1bIOaEze7YXsuAAO4ZBlCcv7NYf/DgNlHLzy4YaqRn
         i2Ng==
X-Gm-Message-State: AOJu0Yz4q0t/5Jm9wB58yI+42Wc0bxjznimTi+HE0BKI1DlZZlm4vcgK
	tVpSKo63bEsMqNwe39dEQzD/yFaVDDsN6UvVRfeT0+2OV1kWS+sGtiNOIhAd6YHAcVYBrfgJceI
	uZ3YrfMHIBIrHNWD5pvE36mw70WrVdrSfHBfUjec=
X-Gm-Gg: ASbGncsvQJcVacs6YAkWt2yXBngnWnD4GXMpJ1azf+aAIdOnvVFl5t3cX3/KdG9k2jI
	9ZAggzNnWnkkUymsPW5nHqn9aDOgb3sw13v6f6e+zTd4iSS15lLi+oPc1FBX+vwiNGc6GgTPHoi
	eFYE3zSX0vIOlVcbm2fCvkk2r61+OXFY4c0HiFZQpKael1XheGqT2+9ZRgHr3uYp+qxY0=
X-Google-Smtp-Source: AGHT+IE5iIGi2hbTttvAEXmrw5WqZEVvK6rcwZ6BRdolzsb0fr05PjIp1KmljgutA1T75vYU0FO+Xf1jXueYk7BREtM=
X-Received: by 2002:a05:6902:f84:b0:e7d:5e41:a8b0 with SMTP id
 3f1490d57ef6-e7f81f00008mr5546973276.38.1748620667729; Fri, 30 May 2025
 08:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Fri, 30 May 2025 21:27:26 +0530
X-Gm-Features: AX0GCFttv976fcdGQgZh0r5UzxcNLMSPxI4rjuscbFe6ArEfprKdfjo3IRXdqsY
Message-ID: <CAFf+5zj2heroGL4cEMRYS9SCkTwDWQh1T9=3ZeDTM9G0aENThQ@mail.gmail.com>
Subject: HTML and Javascript code for validating a text field using Javascript
 and showing error below the text field if the value entered in the text field
 is not valid (Two files: form.html and result.html).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HTML and Javascript code for validating a text field using Javascript
and showing error below the text field if the value entered in the
text field is not valid (Two files: form.html and result.html).

-------------
form.html
-------------

<!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
  var err = document.getElementById("error")
  var x = document.forms["myForm"]["phone_num"].value;
  var re = /^[0-9]{10}$/
  let result = re.test(x)
  if (result) {
      error.innerHTML = ""
      return true
  } else {
      error.innerHTML = "Please enter a valid phone number."
      error.style.color = "red"
      return false
  }
}
</script>
</head>
<body>

<form name="myForm" action="result.html" onsubmit="return
validateForm()" method="post">
  Phone Number (10 digits only): <input type="text" name="phone_num"><br>
  <span id="error"></span><br>
  <input type="submit" value="Submit">
</form>

--------------
result.html
--------------

Success.
